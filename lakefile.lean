import Lake
open Lake DSL

package «DoRA-specific» where
  -- Keep the package intentionally small for artifact review.

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "master"

lean_lib PeftSecurity where

@[default_target]
lean_exe «dora_specific» where
  root := `Main
