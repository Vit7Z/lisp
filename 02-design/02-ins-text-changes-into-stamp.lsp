;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// вставка текстов изменений в штамп                            ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun c:02-ins-text-changes-into-stamp

( / adoc pnt-1 pnt-11 pnt-12 pnt-txt-1 pnt-txt-2 pnt-txt-3 pnt-txt-4 pnt-txt-6 xpnt-1 ypnt-1)

(setvar	"osmode" 6199)
(setvar	"cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq pnt-1 (getpoint "\nУкажите точку вставки\n")
      xpnt-1 (nth 0 pnt-1)
      ypnt-1 (nth 1 pnt-1)
      
      pnt-txt-1 (list (+ xpnt-1 5) (+ ypnt-1 2.5))
      pnt-txt-2 (list (+ xpnt-1 15) (+ ypnt-1 2.5))
      pnt-txt-3 (list (+ xpnt-1 25) (+ ypnt-1 2.5))
      pnt-txt-4 (list (+ xpnt-1 35) (+ ypnt-1 2.5))
      pnt-txt-6 (list (+ xpnt-1 60) (+ ypnt-1 2.5))
      
      pnt-11 (list (- xpnt-1 3) (- ypnt-1 2))
      pnt-12 (list (+ xpnt-1 67) (+ ypnt-1 7))     
);setq

(setvar	"osmode" 0)

(command "_text" "_mc" pnt-txt-1 2.5 0 "*")

(command "_text" "_mc" pnt-txt-2 2.5 0 "**")

(command "_text" "_mc" pnt-txt-3 2.5 0 "Зам.")

(command "_text" "_mc" pnt-txt-4 2.5 0 "****")

(command "_text" "_mc" pnt-txt-6 2.5 0 "**.**")


(if (= (tblsearch "layer" "wspom") nil)
	(command "_layer" "Создать" "wspom" "Тип" "Continuous" "wspom" "Цвет" 3 "wspom" "Установить" "wspom" ""); создаем слой
	(command "_layer" "Установить" "wspom" "") ; устанавливаем слой
);if

(setvar "cecolor" "1")
(setvar "celweight" 60)

(command "_rectangle" pnt-11 pnt-12)

(command "_layer" "Установить" "0" "")

(setvar "celweight" -1)
(setvar "cecolor" "ByLayer")

(vla-endundomark adoc)

(setvar "cmdecho" 1)
(setvar "osmode" 6199)

(princ)
(gc)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////