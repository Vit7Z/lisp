;/////////////////////////////////////////////////////////////////////////////////////////
;/////// уровень 0,000 ///////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////

(defun c:08-level-zero

( / adoc crnt-clayer pnt-1 pnt-ins pnt-txt xpnt-1 xpnt-ins xpnt-txt ypnt-1 ypnt-ins ypnt-txt)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "osmode" 0)
(setvar "CMDECHO" 0)

(setq crnt-clayer (getvar "clayer"));setq

(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			xpnt-1 (+ xpnt-ins 10)
			ypnt-1 (- ypnt-ins 4)
			xpnt-txt (+ xpnt-ins 5)
			ypnt-txt (- ypnt-ins 2) 
);setq

(setq pnt-1 (list xpnt-1 ypnt-1)
			pnt-txt (list xpnt-txt ypnt-txt)
);setq

(if (= (tblsearch "layer" "building") nil)
		(command "_layer" "Создать" "building" "Тип" "Continuous" "building" "Цвет" 2 "building" "Установить" "building" "");создаем слой
		(command "_layer" "Установить" "building" "") ;устанавливаем слой
);if

(command "_.RECTANGLE" pnt-ins pnt-1)
(command "_TEXT" "_MC" pnt-txt 2.5 0 "0,000")

(setvar "osmode" 6199)
(setvar "clayer" crnt-clayer)

(vla-endundomark adoc)

(princ)
)
;/////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////
