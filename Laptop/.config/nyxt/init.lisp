(in-package #:nyxt-user)

(dolist (file (list (nyxt-init-file "status.lisp")
                    (nyxt-init-file "style.lisp")))
  (load file))

(define-configuration (internal-buffer web-buffer nosave-buffer)
  ((default-modes `(vi-normal-mode
                    blocker-mode
                    force-https-mode
                    reduce-tracking-mode
                    ,@%slot-default%))))
(define-configuration (prompt-buffer)
  ((default-modes (append
                   '(vi-insert-mode)
                   %slot-default%))))
(define-configuration nosave-buffer
  ((default-modes `(proxy-mode
                    ,@%slot-default%))))

(define-configuration (buffer internal-buffer editor-buffer prompt-buffer status-buffer)
		      ((current-zoom-ratio 1.90)))


(define-configuration nyxt/web-mode:web-mode
  ;; QWERTY home row.
  ((nyxt/web-mode:hints-alphabet "DSJKHLFAGNMXCWEIO")
   (glyph "W")))

(define-configuration nyxt/vi-mode:vi-normal-mode ((glyph "Normal |")))
(define-configuration nyxt/vi-mode:vi-insert-mode ((glyph "Insert |")))

(defvar *my-keymap* (make-keymap "my-map")
  "Keymap for `my-mode'.")

(define-command org-capture (&optional (buffer (current-buffer)))
  "Org-capture current page."
  (eval-in-emacs
   `(org-link-set-parameters
     "next"
     :store (lambda ()
              (org-store-link-props
               :type "next"
               :link ,(url buffer)
               :description ,(title buffer))))
   `(org-capture)))
(define-key *my-keymap* "C-M-o" 'org-capture)

(define-command youtube-dl-current-page (&optional (buffer (current-buffer)))
  "Download a video in the currently open buffer."
  (eval-in-emacs
   (if (search "youtu" (url buffer))
       `(progn (youtube-dl ,(url buffer)) (youtube-dl-list))
       `(ambrevar/youtube-dl-url ,(url buffer)))))
(define-key *my-keymap* "C-M-c d" 'youtube-dl-current-page)

(define-command play-video-in-current-page (&optional (buffer (current-buffer)))
  "Play video in the currently open buffer."
  (uiop:run-program (list "mpv" (url buffer))))
(define-key *my-keymap* "C-M-c v" 'play-video-in-current-page)

(define-mode my-mode ()
  "Dummy mode for the custom key bindings in `*my-keymap*'."
  ((keymap-scheme (keymap:make-scheme
                   scheme:emacs *my-keymap*
                   scheme:vi-normal *my-keymap*))))


