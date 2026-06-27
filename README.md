# openspec-schemas

Community-схемы для [OpenSpec](https://github.com/Fission-AI/OpenSpec). Каждая схема поставляется как самодостаточный bundle: ее можно установить на user-level для всех локальных проектов или положить в конкретный проект в `openspec/schemas/` и выбирать для change через `--schema <name>`.

## Bridge в этом репозитории

| Bridge | Назначение | Статус |
|---|---|---|
| [superpowers-bridge](./superpowers-bridge/) | Соединяет artifact governance OpenSpec с execution skills из [obra/superpowers](https://github.com/obra/superpowers): brainstorming, writing-plans, TDD через subagents, code review и finishing. Дополнительно добавляет evidence-first artifact `retrospective`. | v1 |

## Почему отдельный репозиторий

[OpenSpec PR #970](https://github.com/Fission-AI/OpenSpec/pull/970) изначально предлагал встроенную схему `sdd-plus-superpowers`. После review maintainer-ов интеграция была вынесена в community repository. Это тот же подход, что и у [community extension catalog](https://speckit-community.github.io/extensions/) в spec-kit: сторонние интеграции живут вне core.

Плюсы:

- OpenSpec core не привязывается к release cadence Superpowers.
- Bridge может развиваться независимо.
- Другие community-схемы можно добавлять рядом как siblings.

## Установка

У каждого bridge есть собственный README с user-level и project-local установкой. Для текущего bridge см. [superpowers-bridge/README.md#установка](./superpowers-bridge/README.md#установка).

## Roadmap

План развития см. в [docs/roadmap.md](./docs/roadmap.md).

## Лицензия

MIT, см. [LICENSE](./LICENSE).
