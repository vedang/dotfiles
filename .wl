;; mode:-*-emacs-lisp-*-

(setq wl-summary-toggle-mime "mime")
(require 'mime-w3m)
(setq mime-edit-split-message nil)

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)

;; use wdanderlust for default compose mail
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

(setq ;; settings for gmail
      elmo-imap4-default-server "imap.gmail.com"
      elmo-imap4-default-user "ved.manerikar@gmail.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl
      elmo-message-fetch-confirm nil

      ;; Offline and synchronization
      wl-plugged t
      elmo-imap4-use-modified-utf7 t
      elmo-imap4-use-cache t
      elmo-nntp-use-cache t
      elmo-pop3-use-cache t
      wl-ask-range nil
      wl-folder-check-async t

      ;;look in zip files as if they were folders
      elmo-archive-treat-file t

      wl-smtp-connection-type 'starttls
      wl-smtp-posting-port 587
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "vedang"
      wl-smtp-posting-server "smtp.gmail.com"
      wl-local-domain "gmail.com"

      wl-from (concat user-full-name " <" user-mail-address ">")
      wl-organization "Infinitely Beta"
      wl-draft-always-delete-myself t
      wl-draft-reply-buffer-style 'full
      wl-fcc "+~/Mail/outbox/out"
      wl-message-visible-field-list '("^To" "^Subject" "^From" "^Date" "^Cc")
      wl-message-ignored-field-list '("^")

      ;;show sent mail by who it was to
      wl-summary-showto-folder-regexp ".*"
      wl-summary-from-function 'wl-summary-default-from
      )

;; default folders
(setq wl-default-folder "%inbox")
(setq wl-default-spec "%")
(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
(setq wl-trash-folder "%[Gmail]/Trash")

;; expiry
(setq wl-expire-alist
      '(("^\\+trash$"   (date 14) remove)
        ;; delete
        ("^\\+tmp$"     (date 7) trash)
        ;; re-file to wl-trash-folder
        ("^\\%inbox"    (date 30) wl-expire-archive-date)
        ;; archive by year and month (numbers discarded)
        ))

;;auto-fill
(setq mime-edit-mode-hook
      '(lambda ()
         (auto-fill-mode 1)))

;; browse url
(add-hook 'mime-view-mode-hook
	  (lambda ()
	    (local-set-key "f" 'browse-url)))

;;; @ bbdb
;; (setq mime-bbdb/use-mail-extr nil)
;; (require 'bbdb-wl)
;; (bbdb-wl-setup)
;; (require 'mime-bbdb)
;;
;; (autoload 'bbdb         "bbdb-com" "Insidious Big Brother Database" t)
;; (autoload 'bbdb-name    "bbdb-com" "Insidious Big Brother Database" t)
;; (autoload 'bbdb-company "bbdb-com" "Insidious Big Brother Database" t)
;; (autoload 'bbdb-net     "bbdb-com" "Insidious Big Brother Database" t)
;;
;; (add-hook 'wl-mail-setup-hook 'bbdb-insinuate-sendmail)
;;
;; (setq bbdb-use-alternate-names t)
;;
;; (setq bbdb-file "~/.bbdb")
;; (setq bbdb/mail-auto-create-p   'bbdb-ignore-some-messages-hook)
;;
;; ;; add record to .bbdb manually
;; (setq bbdb-new-nets-always-primary t)
;; (setq bbdb/mail-auto-create-p nil)
;;
;; ;;; height of BBDB's window
;; (setq bbdb-pop-up-target-lines 7)
;;
;; ;;; popup display of record in the .bbdb
;; (setq bbdb-use-pop-up t)
;; (setq signature-use-bbdb t)
;; (setq bbdb-north-american-phone-numbers-p nil)
;;
;; ;;; automatic adding to ML field
;; (add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
;;
;; ;;; hide bbdb field while wl-folder-suspend
;; (defadvice wl-folder-suspend (after wl-bbdb-suspend activate compile)
;;   (interactive)
;; (bbdb-wl-exit-2))
;; (defadvice wl-exit (after wl-bbdb-suspend activate compile)
;;   (interactive)
;; (bbdb-wl-exit-2))
;;
;; (put 'ML 'field-separator "\n")
;; (put 'User-Agent 'field-separator "\n")
;;
;; (setq bbdb-auto-notes-alist
;;        '(
;;        ("X-ML-Name" (".*$" ML 0))
;;        ("X-Mailinglist" (".*$" ML 0))
;;        ("X-Ml-Name" (".*$" ML 0))
;;        ("X-Mailer" (".*$" User-Agent 0))
;;        ("X-Newsreader" (".*$" User-Agent 0))
;;        ("User-Agent" (".*$" User-Agent 0))
;;        ("X-Face" ("[ \t\n]*\\([^ \t\n]*\\)\\([ \t\n]+\\([^ \t\n]+\\)\\)?\\([ \t\n]+\\([^ \t\n]+\\)\\)?\\([ \t\n]+\\([^ \t\n]+\\)\\)?"
;;                                  face "\\1\\3\\5\\7"))
;;        ))

