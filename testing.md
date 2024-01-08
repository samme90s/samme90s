# Testing

## Basics

Controllability (what do we want to test?) + Observability (is it observable?) = Testability

By **isolating** tested code we increase the **accuracy** (traceability).

fault -> error -> propagation -> failure -> observation

## Test Levels

| Level       | Description                                   |
| ----------- | --------------------------------------------- |
| Unit        | Individual software components or modules.    |
| Integration | How pieces work together                      |
| System      | All pieces (e.g. backend+ frontend)           |
| Beta        | Limited audience end user system testing      |
| Acceptance  | Customer validation (software is as expected) |
| Regression  | Rerun tests after a change                    |

## Hard to Test

### Unreachable code

- Complex (divide and conquer)
- Static (refrain from creating globals)
- Object creation (dependency injection)

### Dependencies

- Database/Files/API (adapter/mock)

### Indeterministic code

- Random/Time (mock)

## Mocking

Is often used to replace difficult dependencies with configurable mock objects through dependency injection.
