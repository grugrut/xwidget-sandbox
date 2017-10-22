;;; widget-button.el ---
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

(require 'widget)

(defun widget-create-example ()
  "A example function using 'widget-create."
  (interactive)
  (switch-to-buffer "*widget-example*")
  (widget-create 'push-button
                 :notify (lambda (&rest ignore)
                           (message "Pushed widget!!"))
                 "Push me!!")
  (use-local-map widget-keymap)
  (widget-setup))

(defun make-button-example ()
  "A example function using 'make-button."
  (interactive)
  (switch-to-buffer "*button-example*")
  (insert "this is a button.")
  (make-button 11 17
               'follow-link t
               'action '(lambda (button) (goto-char (point-max))
                          (insert "Pushed button!!\n"))))

(require 'xwidget)
(defun xwidget-insert-example ()
  "A example function using 'xwidget-insert."
  (interactive)
  (switch-to-buffer "*xwidget-example*")
  (insert "        ")
  (goto-char (point-min))
  (xwidget-insert (point) 'Button "Click me" 200 200))

(provide 'widget-button)

;;; widget-button.el ends here
