;;; xwidget-quiz.el ---
;; Author: grugrut <grugruglut+github@gmail.com>
;; URL:
;; Version: 1.00

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'xwidget)
(defun xwidget-quiz ()
  "show quiz"
  (interactive)
  (switch-to-buffer "*xwidget-quiz*")
  (text-mode)
  (text-scale-set 10)
  (insert "                        ")
  (goto-char (point-min))
  (insert "問題\nこれはemacs25で動く\n")
  (forward-char 1)
  (setq-local maru-button (xwidget-insert (point) 'Button "○" 200 200))
  (forward-char 6)
  (setq-local batu-button (xwidget-insert (point) 'Button "×" 200 200))
  (define-key (current-local-map) [xwidget-event] 'xwidget-quiz-handler))

(defun xwidget-quiz-handler ()
  (interactive)
  (message "stuff happend to xwidget %S" last-input-event)
  (let*
      ((xwidget-event-type (nth 1 last-input-event))
       (xwidget (nth 2 last-input-event)))
    (goto-char (point-max))
    (insert "\n")
    (if (eq maru-button xwidget)
        (insert "不正解 ><\n")
      (insert "正解 ^^b\n"))
    (insert "正解は ×\n"
            "Emacs 25では、webkitしか動作しません")
    ))


(provide 'xwidget-quiz)

;;; xwidget-quiz.el ends here
