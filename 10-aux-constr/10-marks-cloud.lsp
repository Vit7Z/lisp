;/////// *************************************************************////////////////////
;/////// название программы****************                           ////////////////////
;/////// *************************************************************////////////////////
(defun c:10-marks-cloud

( / adoc)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "layer" "wspom") nil)
	(command "_layer" "Создать" "wspom" "Тип" "Continuous" "wspom" "Цвет" 3 "wspom" "Установить" "wspom" ""); создаем слой
	(command "_layer" "Установить" "wspom" "") ; устанавливаем слой
);if

(setvar "cecolor" "1")
(setvar "celweight" 60)

(command "_rectangle" pause pause)

(command "_layer" "Установить" "0" "")

(setvar "osmode" 6199)
(setvar "celweight" -1)
(setvar "cecolor" "ByLayer")
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)

;/////// *************************************************************////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////
;/////// *************************************************************////////////////////