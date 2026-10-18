# Implementation

The concrete choices. Nothing here is a claim.

- [Specs](Specs.md) — per E-id: architecture, hyperparameters, data, seeds, compute
- [Figures](Figures.md) — what each figure must show
- [Code Design](Code_Design.md) — repo structure and module design
- [The code](../__CODE_DIR__/README.md) — the code folder, published on its own

## Upstream and downstream

- E-ids are defined in [Experiments](../2_Idea/Experiments.md) and reused here.
- Runs recorded from these specs go to `../4_Results_and_Tracking/Runs/`.
- Figures produced to these specs are generated under `../__CODE_DIR__/outputs/`; the
  ones the paper uses are copied into `../5_Paper/figures/`.
