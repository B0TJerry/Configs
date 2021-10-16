(in-package #:nyxt-user)

(define-configuration status-buffer
  ((glyph-mode-presentation-p t)))

(define-configuration nyxt/force-https-mode:force-https-mode ((glyph "FH")))
(define-configuration nyxt/blocker-mode:blocker-mode ((glyph "B")))
(define-configuration nyxt/proxy-mode:proxy-mode ((glyph "P")))
(define-configuration nyxt/reduce-tracking-mode:reduce-tracking-mode
  ((glyph "RT")))
(define-configuration nyxt/certificate-exception-mode:certificate-exception-mode
  ((glyph "CE")))
(define-configuration nyxt/style-mode:style-mode ((glyph "S")))
(define-configuration nyxt/help-mode:help-mode ((glyph "H")))
