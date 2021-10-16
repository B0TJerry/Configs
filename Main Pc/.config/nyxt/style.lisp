(in-package #:nyxt-user)

(define-configuration window
  ((message-buffer-style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "#282828 !important"
         :color "#ebdbb2 !important")
        ("head"
         :color "#ebdbb2 !important"
         :background-color "#ebdbb2 !important")))))))

(define-configuration prompt-buffer
  ((style (str:concat
           %slot-default%
           (cl-css:css
            '((body
               :background-color "#282828 !important"
               :color "ebdbb2 !important")
              ("#prompt"
               :background-color "#3c3836 !important"
               :color "#ebdbb2 !important")
              ("#prompt-area"
               :background-color "#3c3836 !important"
               :color "#ebdbb2 !important")
              ("#prompt-area-vi"
               :background-color "#3c3836 !important"
               :color "#ebdbb2 !important")
              ("#prompt-modes"
               :background-color "#3c3836 !important"
               :color "#ebdbb2 !important")
              ("#vi-mode"
               :color "#282828")
              (".vi-insert-mode"
               :background-color "#488588 !important")
              (".vi-normal-mode"
               :background-color "#cc241d"
               :color "#ebdbb2 !important")
              ("#input"
               :background-color "#ebdbb2 !important")
              (".source-name"
               :color "#ebdbb2 !important"
               :background-color "#3c3836 !important")
              (".source-content"
               :background-color "3c3836 !important")
              (".source-content th"
               :border "1px solid #ebdbb2 !important"
               :background-color "#282828 !important")
              ("#selection"
               :background-color "#488588 !important"
               :color "#282828 !important")
              (.marked :background-color "#83a598 !important"
                       :font-weight "bold !important"
                       :color "#3c3836 !important")
              (.selected :background-color "#458588 !important"
                         :color "#282828 !important")))))))

(define-configuration internal-buffer
  ((style
    (str:concat
     %slot-default%
     (cl-css:css
      '((title
         :color "#ebdbb2 !important")
        (body
         :background-color "#282828 !important"
         :color "#ebdbb2 !important")
        (hr
         :color "#ebdbb2 !important"
         :background-color "#ebdbb2 !important")
        (a
         :color "#458588 !important")
        (.button
         :color "#ebdbb2 !important"
         :background-color "#458588 !important")))))))


(define-configuration panel-buffer
  ((style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "#3c3836 !important"
         :color "#3c3836 !important")
        (a
         :color "#3c3836 !important")))))))


(define-configuration nyxt/history-tree-mode:history-tree-mode
  ((nyxt/history-tree-mode::style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "#282828 !important "
         :color "#ebdbb2 !important")
        (hr
         :color "#ebdbb2 !important")
        (a
         :color "#ebdbb2 !important")
        ("ul li::before"
         :background-color "#ebdbb2 !important")
        ("ul li::after"
         :background-color "#ebdbb2 !important")
        ("ul li:only-child::before"
         :background-color "#ebdbb2 !important")))))))

(define-configuration nyxt/web-mode:web-mode
  ((nyxt/web-mode:highlighted-box-style
    (cl-css:css
     '((".nyxt-hint.nyxt-highlight-hint"
        :background "#ebdbb2 !important")))
    :documentation "The style of highlighted boxes, e.g. link hints.")))

(define-configuration status-buffer
  ((style (str:concat
           %slot-default%
           (cl-css:css
            '(("#controls"
               :background-color "#458588 !important"
               :color "#ebdbb2 !important")
              ("#url"
               :background-color "#3c3836 !important"
               :color "#ebdbb2 !important")
              ("#modes"
               :background-color "#3c3836 !important"
               :color "#ebdbb2 !important")
              ("#tabs"
               :background-color "#458588 !important"
               :color "#ebdbb2 !important")))))))

(define-configuration nyxt/style-mode:dark-mode
  ((style #.(cl-css:css
             '((*
                :background-color "#282828 !important"
                :background-image "none !important"
                :color "#ebdbb2")
               (a
                :background-color "#282828 !important"
                :background-image "none !important"
                :color "#ebdbb2 !important"))))))


;;(DEFINE-CONFIGURATION DOWNLOAD-MODE
;;  ((STYLE
;;    (CL-CSS:CSS
;;     '((".download" :MARGIN-TOP "10px" :PADDING-LEFT "5px" :BACKGROUND-COLOR
;;        "#282828" :BORDER-RADIUS "3px")
;;       (".download-url" :OVERFLOW "auto" :WHITE-SPACE "nowrap")
;;       (".download-url a" :FONT-SIZE "small" :COLOR "#282828")
;;       (".status p" :DISPLAY "inline-block" :MARGIN-RIGHT "10px")
;;       (".progress-bar-container" :HEIGHT "20px" :WIDTH "100%" :background-color "#3c3836")
;;       (".progress-bar-base" :HEIGHT "100%" :BACKGROUND-COLOR "#282828")
;;       (".progress-bar-fill" :HEIGHT "100%" :BACKGROUND-COLOR "#458588"))))))
;;
;;I can't get the look of The list downloads to look differently for the life of me
