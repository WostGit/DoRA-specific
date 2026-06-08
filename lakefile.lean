import Lake
open Lake DSL

package «DoRA-specific» where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "25fc690d5a79faca0486a423d1e441ffc84e0377"

lean_lib PeftSecurity where

@[default_target]
lean_exe «dora_specific» where
  root := `Main