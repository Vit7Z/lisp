;/////// *************************************************************////////////////////
;/////// название программы****************                           ////////////////////
;/////// *************************************************************////////////////////
(defun c:10-marks-text

( / adoc pnt-ins txt-1)

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

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n"));setq


(setq txt-1
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 pnt-ins) ; нач точка текста
      '(1 . "*******") ; содержание текста
      '(40 . 15) ; высота текста
      '(41 . 15) ; растяжение текста
      '(42 . 15) ; ширина текста
       (cons 50 0) ; поворот текста
       (cons 71 4) ; выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq














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