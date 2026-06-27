# Инструкции для Codex в openspec-schemas

## Правила проекта

Этот репозиторий поддерживает community bundles схем OpenSpec. Активный bundle -
`superpowers-bridge`.

OpenSpec + `superpowers-bridge` являются источником истины для поведенческих
изменений в этом репозитории. Для любых изменений schema behavior, порядка
artifact, поведения `/opsx:*`, смысла templates, CI behavior или языковой
политики синхронно обновляйте:

1. `superpowers-bridge/schema.yaml`
2. `superpowers-bridge/README.md`
3. затронутые `superpowers-bridge/templates/*.md`
4. focused tests / fixtures, особенно `tests/superpowers-bridge-order.sh`
5. CI workflows, если они входят в enforcement boundary

Не возвращайте параллельный planning lifecycle. Документированный порядок и
machine-enforced порядок должны совпадать:

```text
brainstorm -> proposal -> design -> specs -> tasks -> plan -> verify -> retrospective
```

## Языковая политика

Весь human-facing Markdown в этом репозитории ведется на русском. Английский
допустим для machine tokens, OpenSpec keywords, artifact ids, YAML keys, CLI
commands, skill names, code identifiers, Conventional Commits, внешних названий
продуктов и точных цитат источников.

Не добавляйте отдельные locale-specific Markdown-копии, пока явно не изменена
языковая политика репозитория.

## Процесс изменения схемы

Для изменений в `superpowers-bridge/schema.yaml` или templates:

1. Сначала прочитайте текущие schema и README.
2. Обновите schema, README, templates и tests вместе.
3. Проверьте локально:

   ```bash
   openspec schema validate superpowers-bridge
   tests/superpowers-bridge-order.sh
   git diff --check
   ```

4. Если меняются artifact order или `requires:` edges, проверьте, что после
   `brainstorm.md` ready только `proposal.md`, после `proposal.md` ready только
   `design.md`, а после `proposal.md` + `design.md` ready `specs`.

## Красные флаги

- Не добавляйте instructions, которые сами выполняют `git add` или `git commit`
  за пользователя.
- Не убирайте PRECHECK behavior без более сильной замены.
- Не меняйте `requires:` edges без обновления README и regression tests.
- Не восстанавливайте locale-specific README/roadmap/template copies, пока
  сначала не изменена языковая политика репозитория.
- Не делайте `/opsx:continue` зависимым от произвольного порядка
  `openspec status --json`, когда ready несколько artifacts; tie-break должен
  идти по порядку artifacts в schema.

## Исторические артефакты

Файлы в `docs/superpowers/**` - исторические planning/spec/retro artifacts. Они
могут давать контекст, но не являются каноническим live workflow contract.
