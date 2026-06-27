# CLAUDE.md

> Контекст для Claude Code при работе в этом репозитории.
>
> Описание репозитория и доступных bridge-схем см. в [README.md](./README.md).
> Этот файл фиксирует локальные правила, соглашения и красные флаги.

---

## Структура

```text
openspec-schemas/                     <- этот репозиторий
├── README.md                         <- основной вход, русский текст
├── AGENTS.md                         <- правила для Codex и других agent runtimes
├── CLAUDE.md                         <- правила для Claude
├── LICENSE                           <- MIT
├── .gitignore
├── .github/workflows/
│   ├── validate-schemas.yml          <- CI валидирует каждый bridge через openspec schema validate
│   └── version-check.yml             <- еженедельно проверяет версии upstream OpenSpec / Superpowers
├── docs/
│   ├── roadmap.md                    <- публичный roadmap
│   └── superpowers/
│       ├── specs/                    <- исторические design specs
│       ├── plans/                    <- исторические implementation plans
│       └── retrospectives/           <- исторические retrospectives
└── superpowers-bridge/               <- первый bridge, самодостаточный schema bundle
    ├── README.md                     <- полная документация bridge
    ├── schema.yaml                   <- machine-readable schema definition
    └── templates/                    <- artifact templates
        ├── brainstorm.md
        ├── proposal.md
        ├── design.md
        ├── spec.md
        ├── tasks.md
        ├── plan.md
        ├── verify.md
        └── retrospective.md
```

Будущие bridge добавляются как новый каталог `<new-bridge>/` в корне с той же структурой, что и `superpowers-bridge/`. Для CI достаточно добавить bridge в `matrix.bridge` в `.github/workflows/validate-schemas.yml`.

## Имена

- **Repo / directory / schema name**: lowercase + hyphen, с осознанным singular/plural.
  - repo: `openspec-schemas` - plural, потому что репозиторий может содержать несколько bridge.
  - bridge dir / schema name: `superpowers-bridge` - singular, потому что это один конкретный bridge.
  - PascalCase не используем: OpenSpec как проект пишется с заглавными, но CLI / npm package и schema names функционально lowercase.
- **Markdown-язык проекта**: русский. Английскими остаются только machine tokens, команды, имена artifact, имена skills, YAML keys, Conventional Commits и внешние названия.
- **Locale-файлы**: отдельные переводные Markdown-копии в этом репозитории не поддерживаются. Если потребуется новая локаль, сначала нужно явно обновить эту политику и все ссылки.

## Языковая политика

| Тип файла | Правило |
|---|---|
| `README.md`, `docs/*.md`, `superpowers-bridge/README.md` | Русский human-facing текст |
| `AGENTS.md`, `CLAUDE.md` | Русский, как рабочее руководство для агентов |
| `schema.yaml` | Английские machine-facing поля и инструкции, если они используются OpenSpec/LLM как API-контракт |
| `templates/*.md` | Русские пояснения, английские обязательные OpenSpec headers/tokens сохраняются |
| Commit message | Английский Conventional Commits |
| Code comment | Следовать языку окружающего файла; в коде обычно английский |

При изменении schema behavior, порядка artifact или `/opsx:*` поведения нужно синхронно обновлять:

1. `superpowers-bridge/schema.yaml`
2. `superpowers-bridge/README.md`
3. связанные templates
4. локальные tests / fixtures
5. CI workflows, если они участвуют в enforcement boundary

## Процесс изменения схемы

1. Отредактировать `<bridge>/schema.yaml` или `<bridge>/templates/*.md`.
2. Проверить схему в локальном test project:

   ```bash
   mkdir -p /tmp/test-project/openspec/schemas
   cp -R <bridge>/ /tmp/test-project/openspec/schemas/
   cd /tmp/test-project
   openspec schema validate <bridge-name>
   openspec schemas
   ```

3. Если изменились порядок artifact, `requires:` edges, timing notes или ошибочное поведение `/opsx:continue`, обновить `superpowers-bridge/README.md`, особенно DAG, step-by-step usage и "Design touches".
4. Для behavior changes добавить или обновить focused test/fixture.
5. Commit message писать по Conventional Commits: `feat:`, `fix:`, `refactor:`, `chore:`, `docs:`, `ci:`.
6. Push запускает CI.

## Ответы на замечания PR #970

Review в [OpenSpec PR #970](https://github.com/Fission-AI/OpenSpec/pull/970) поднял три риска. Эта schema в v1 отвечает на них так:

| Риск | Ответ |
|---|---|
| #3 Schema сама коммитит пользовательский git | Полностью удалено. Step 0 стал skill PRECHECK и не мутирует git. |
| #1 Жесткая связка с Superpowers без capability detection | Layer 1: каждая instruction с skill invocation делает PRECHECK наличия skill и останавливается при отсутствии. Layer 2: verify / retrospective используют evidence-based PRECHECK через `git log`, `grep` и состояние `verify.md`. |
| #2 `verify` timing mismatch, аналогично `retrospective` | Известное ограничение описано в bridge README. Полное исправление ждет upstream `post_apply` phase. Сейчас mitigation - evidence-based PRECHECK. |

Красные флаги при правке schema:

- Не добавлять instructions, которые сами делают `git add` / `git commit` за пользователя.
- Не убирать PRECHECK без более сильной замены.
- Не менять `requires:` edges без обновления README, tests и `/opsx:continue` ожиданий.
- Не менять schema name без синхронного обновления bridge docs, top-level README и install snippets.
- Не возвращать параллельный planning lifecycle: documented order и machine-enforced order должны совпадать.

## Связанные материалы

- Design spec: [docs/superpowers/specs/2026-05-02-openspec-schemas-monorepo-design.md](./docs/superpowers/specs/2026-05-02-openspec-schemas-monorepo-design.md)
- Implementation plan: [docs/superpowers/plans/2026-05-02-phase-1-implementation.md](./docs/superpowers/plans/2026-05-02-phase-1-implementation.md)
- PR #970 review: <https://github.com/Fission-AI/OpenSpec/pull/970>
- Spec-kit superpowers bridges:
  - [RbBtSn0w/spec-kit-extensions/superpowers-bridge](https://github.com/RbBtSn0w/spec-kit-extensions/tree/main/superpowers-bridge)
  - [WangX0111/superspec](https://github.com/WangX0111/superspec)
