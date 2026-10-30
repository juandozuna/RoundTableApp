import { assert, assertEquals, assertThrows } from "jsr:@std/assert@1";
import { ApiError } from "./errors.ts";
import {
  csvToCurriculum,
  curriculumFromBody,
  parseCsv,
  validateCurriculum,
  validateTranslationFile,
} from "./curriculum.ts";
// The import script keeps its own copy; both must agree on what is importable.
import { validateCurriculum as validateWithScript } from "../../../scripts/lib/curriculum.mjs";

const example = () =>
  JSON.parse(Deno.readTextFileSync(new URL("../../curriculum/curriculum.example.json", import.meta.url)));

Deno.test("the example file is valid: 5 modules, 10/10/10/10/8 values", () => {
  const data = example();
  assertEquals(validateCurriculum(data), []);
  assertEquals(data.modules.map((m: { values: unknown[] }) => m.values.length), [10, 10, 10, 10, 8]);
});

Deno.test("refuses partial files, gaps, duplicates and bad types", () => {
  const missingModule = example();
  missingModule.modules.pop();
  assert(validateCurriculum(missingModule).length > 0);

  const missingValue = example();
  missingValue.modules[4].values.pop();
  assert(validateCurriculum(missingValue).some((e) => e.includes("debe tener 8 valores")));

  const gaps = example();
  gaps.modules[0].values[2].number = 9;
  gaps.modules[0].values[0].questions = [];
  gaps.modules[0].values[1].questions[1].code = gaps.modules[0].values[1].questions[0].code;
  gaps.modules[1].values[0].questions[0].responseType = "essay";
  gaps.modules[2].values[0].name = " ";
  const problems = validateCurriculum(gaps).join("\n");
  for (const fragment of ["el número debe ser 3", "al menos una pregunta", "código repetido", "responseType", "nombre"]) {
    assert(problems.includes(fragment), fragment);
  }
  assert(validateCurriculum({}).length > 0);
  assert(validateCurriculum(null).length > 0);
});

Deno.test("agrees with scripts/lib/curriculum.mjs on valid and invalid files", () => {
  const mutations: Array<(d: ReturnType<typeof example>) => void> = [
    () => {},
    (d) => d.modules.pop(),
    (d) => d.modules[4].values.pop(),
    (d) => (d.modules[0].values[2].number = 9),
    (d) => (d.modules[0].values[0].questions = []),
    (d) => (d.modules[1].values[3].questions[0].code = "Bad Code"),
    (d) => (d.modules[1].values[3].questions[0].responseType = "essay"),
    (d) => (d.modules[3].values[0].name = ""),
    (d) => (d.modules[2].number = 7),
    (d) => (d.modules[0].description = 5),
  ];
  for (const [i, mutate] of mutations.entries()) {
    const data = example();
    mutate(data);
    assertEquals(validateCurriculum(data).length === 0, validateWithScript(data).length === 0, `mutation ${i}`);
  }
});

Deno.test("translation files are partial but keyed and textual", () => {
  assertEquals(validateTranslationFile({ modules: [{ number: 1, name: "Character" }] }, "en"), []);
  assertEquals(
    validateTranslationFile({ modules: [{ number: 1, values: [{ number: 2, questions: [{ code: "x", text: "Why?" }] }] }] }),
    [],
  );
  assert(validateTranslationFile({ locale: "pt", modules: [] }, "en")[0].includes("pt"));
  assert(validateTranslationFile({ modules: [{ name: "x" }] }).length === 1);
  assert(validateTranslationFile({ modules: [{ number: 1, name: 5 }] }).length === 1);
  assert(validateTranslationFile([]).length === 1);
});

Deno.test("CSV: quotes, semicolons, BOM and blank cells", () => {
  assertEquals(parseCsv('﻿a;b\n"x;y";"say ""hi"""\n\n'), [["a", "b"], ["x;y", 'say "hi"']]);
  const csv = [
    "kind,module,value,code,name,description,booklet_reference,text,response_type",
    "module,1,,,Carácter,,,,",
    'value,1,1,,Integridad,"Hacer lo correcto, siempre",M1 · V1,,',
    "question,,1,por_que,,,,¿Por qué?,text",
    "question,,1,ejemplo,,,,¿Quién?,person",
  ].join("\r\n");
  assertEquals(csvToCurriculum(csv), {
    modules: [{
      number: 1,
      name: "Carácter",
      values: [{
        number: 1,
        name: "Integridad",
        description: "Hacer lo correcto, siempre",
        bookletReference: "M1 · V1",
        questions: [
          { code: "por_que", text: "¿Por qué?", responseType: "text" },
          { code: "ejemplo", text: "¿Quién?", responseType: "person" },
        ],
      }],
    }],
  });
});

Deno.test("CSV problems are reported, and a body needs curriculum or csv", () => {
  const header = "kind,module,value,code,name,text";
  for (const bad of ["", "a,b\n1,2", `${header}\nthing,1,,,x,`, `${header}\nquestion,,9,q,,hi`, `${header}\nvalue,x,1,,v,`]) {
    const error = assertThrows(() => csvToCurriculum(bad), ApiError);
    assertEquals(error.code, "curriculum_invalid");
  }
  assertThrows(() => curriculumFromBody({}), ApiError);
  assertEquals(curriculumFromBody({ curriculum: { modules: [] } }), { modules: [] });
});
