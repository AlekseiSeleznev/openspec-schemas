# Roadmap

Репозиторий поддерживается как side project. Этот roadmap описывает актуальное направление, но не является контрактом: порядок и состав задач могут меняться по итогам реального использования.

## v1 - выпущено

- [x] **`superpowers-bridge`** - bridge OpenSpec <-> obra/superpowers с native artifact `retrospective`.

## v1.x - follow-up backlog

Эти пункты выросли из исходного implementation plan и последующих правок:

- [ ] **Упаковка `workflow-retrospective` как skill** - сейчас процедура retrospective встроена в schema instruction. Если пользователям понадобится вызывать `/workflow-retrospective` интерактивно вне schema flow, ее можно вынести в Claude Code plugin.
- [ ] **End-to-end CI integration test** - текущий CI запускает только `openspec schema validate`. Round-trip test от `/opsx:new` до `/opsx:archive` ловил бы больше regressions, но требует Superpowers в CI.
- [ ] **Полировка verify artifact** - ясность template, optional handling для design, worktree origin, критерии PASS и заметки по TDD.
- [ ] **Наблюдение за `/opsx:continue` ordering** - после graph tightening порядок planning artifact enforced через `requires:`. Если OpenSpec изменит порядок `status --json`, skill должен продолжать выбирать artifact по порядку schema lifecycle.

## Ждем OpenSpec core

Эти пункты невозможно надежно решить только community-схемой:

- [ ] **Поле `requires_skills:` в schema** - заменило бы prompt-level PRECHECK на engine-validated declarations.
- [ ] **`post_apply` phase** - позволил бы сделать `verify` и `retrospective` настоящими post-apply hooks вместо artifacts с timing mismatch, аналогично `after_implement` в spec-kit.

## Возможные будущие bridge

Если появится реальный спрос:

- [ ] **`obra-bridge`** - более широкая интеграция с другими инструментами `obra/*`.
- [ ] **Domain-specific schemas** - например, вариант `data-pipeline` с усиленными artifacts для schema validation.

Предложения по bridge лучше оформлять issue: <https://github.com/AlekseiSeleznev/openspec-schemas/issues>.
