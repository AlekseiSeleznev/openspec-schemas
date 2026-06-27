<!-- Source: superpowers-bridge/templates/adopters/CLAUDE.md.fragment.md -->
<!-- Вставьте этот раздел в project CLAUDE.md, чтобы Claude правильно маршрутизировал работу через эту schema. -->
<!-- Если вы форкнули schema name или repo URL, обновите ссылки; иначе оставьте как есть. -->

## Workflow routing (читать на старте сессии)

Этот проект использует [superpowers-bridge](https://github.com/AlekseiSeleznev/openspec-schemas/tree/main/superpowers-bridge), который соединяет OpenSpec и Superpowers. Детальные правила по artifact paths, PRECHECK и lifecycle описаны в README bridge; этот раздел задает routing guidance для Claude.

### Entry routing

| Trigger | Что делать |
|---|---|
| Пользователь начинает narrative "обсудим дизайн / давай brainstorm" | Запустить verbal `superpowers:brainstorming` с той же clarification gate / grilling / domain-modeling дисциплиной, но не писать в `docs/superpowers/specs/` и не создавать side artifacts. Когда разговор сходится по 7 критериям ниже, предложить `/opsx:propose` |
| Пользователь прямо вызывает `/opsx:new`, `/opsx:ff` или `/opsx:propose` | Следовать schema flow; artifact instructions будут injected на каждом шаге |
| Пользователь явно просит bug fix / typo / config tweak / doc update | Direct PR, не открывать change, если нет изменения контракта |
| Пользователь уже внутри change | Продвигать через `/opsx:continue`, `/opsx:apply`, `/opsx:verify` или `/opsx:archive` |

### Когда не использовать opsx

| Ситуация | Direct PR? |
|---|---|
| Новая feature / capability / архитектурное изменение / breaking change | Нет, использовать opsx |
| Bug fix без contract change / test backfill / linter tweak / non-breaking upgrade / typo / docs / config value tweak | Да |

Принцип: процесс пропорционален риску. External contracts, schema, cross-system integration и compliance boundaries идут через opsx; остальное - direct PR.

### Verbal brainstorm -> opsx promotion criteria

Все 7 условий должны быть выполнены. Если хотя бы одно отсутствует, продолжайте brainstorm, задавайте следующий прямой вопрос и не пишите в `docs/superpowers/specs/`.

1. **Scope locked** - одной фразой понятно, что входит и что не входит.
2. **Major design forks resolved** - alternatives рассмотрены, выбран путь.
3. **Cross-system dependencies mapped** - для каждой зависимости выбран статус ready / mockable / non-blocking unknown с owner и причиной, почему это не блокирует downstream artifacts.
4. **Acceptance criteria stateable** - есть конкретные pass conditions, например `./mvnw clean verify` + N deliverables.
5. **Capabilities identifiable** - capability list можно назвать без guessing.
6. **No blocking TBDs** - нет неизвестных, которые могут изменить proposal, design, specs, tasks, plan или apply.
7. **Conversation converging** - последние реплики явно подтверждают направление, а не открывают новые alternatives.

После promotion в opsx итоговый `brainstorm.md` должен включать `## OpenSpec Capture Summary`: clarification gate, evidence checked, domain model, decision tree, resolved decisions, rejected alternatives, risks, non-blocking TBDs, documentation candidates и validated direction.

Когда все 7 условий выполнены, предложите пользователю `/opsx:propose` и дождитесь явного ack. Не запускайте автоматически.

### Front-door anti-patterns

- Brainstorming пишет в `docs/superpowers/specs/`.
- Writing-plans пишет в `docs/superpowers/plans/`.
- Opsx promotion происходит при unresolved blocking TBD.
- Change открывается для bug fix / typo.

Подробности: [superpowers-bridge README §Entry и exit gates](https://github.com/AlekseiSeleznev/openspec-schemas/blob/main/superpowers-bridge/README.md#entry-и-exit-gates).
