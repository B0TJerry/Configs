(define-configuration (prompt-buffer)
  ((default-modes (append
                   '(vi-insert-mode)
                   %slot-default%))))
(define-configuration (buffer web-buffer)
  ((default-modes (append
                   '(vi-normal-mode)
                   '(blocker-mode)
                   '(reduce-tracking-mode)
                  %slot-default%))))
(define-configuration minibuf
  ((style
    (str:concat
     %slot-default
     (cl-css:css
      '((body
         :background-color "black"
         :color "#808080")))))))
(define-configuration internal-buffer
  ((style
    (str:concat
     %slot-default
     (cl-css:css
      '((body
         :background-color "black"
         :color "lightgray")
        (hr
         :color "darkgray")
        (.button
         :color "#333333")))))))
