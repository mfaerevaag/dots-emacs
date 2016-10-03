(setq x-select-enable-clipboard 't)

(require 'generic-x)
(define-generic-mode 'if-mode
 '("%")
 '("section" "types" "inits" "rules" "goals" "step" "initial_state" "attack_state" "not")
 '(("^\\s-*.+\\s-*:\\s-*\\([A-Za-z0-9_()]+\\)" (1 font-lock-type-face))
   ("\\b[A-Z_][a-zA-Z0-9_]*" . font-lock-variable-name-face)
   ("[a-z][a-zA-Z0-9_]*\\|[0-9]*" . font-lock-constant-face)
   ("^\\s-*step\\s-+\\([a-z][a-zA-Z0-9_]*\\)" (1 font-lock-function-name-face))
  )
 '("\\.if$")
 '(list (lambda () (auto-fill-mode 0)) (lambda () (modify-syntax-entry ?_ "w")))
 "A mode for AVISPA Intermediate Format files"
)

(require 'generic-x)
(define-generic-mode 'anb-mode
 '("#")
 '("Protocol" "Types" "Agent" "Number" "Function" "Symmetric_key" "PublicKey" "Knowledge" "where" "Actions" "Goals" "authenticates" "on" "secrecy" "of")
 '(("^\\s-*.+\\s-*::\\s-*\\([A-Za-z0-9_()]+\\)" (1 font-lock-type-face))
   ("\\b[A-Z_][a-zA-Z0-9_]*" . font-lock-variable-name-face)
   ("[a-z][a-zA-Z0-9_]*\\|[0-9]*" . font-lock-constant-face)
   ("^\\s-*step\\s-+\\([a-z][a-zA-Z0-9_]*\\)" (1 font-lock-function-name-face))
  )
 '("\\.AnB$")
 '(list (lambda () (auto-fill-mode 0)) (lambda () (modify-syntax-entry ?_ "w")))
 "A mode for AnB files"
)

(provide 'anb)
