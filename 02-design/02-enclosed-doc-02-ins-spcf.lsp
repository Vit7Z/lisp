;/////// ************************************************************ //////////////////////////////
;///////                                                              //////////////////////////////
;/////// ************************************************************ //////////////////////////////
(defun c:02-enclosed-doc-02-ins-spcf

( / adoc pnt-ins xpnt-ins ypnt-ins)

;устанавливаем системные переменные
(setvar	"OSMODE" 6199)
(setvar	"CMDECHO" 0)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar	"OSMODE" 6199)
		
(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
	);setq
			
	(setvar	"OSMODE" 0)
			
	(command "_insert" "вед-осн-компл-рч-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
	(command "_TEXT" "_MC" (list (- xpnt-ins 30) (- ypnt-ins 4)) 2.5 0 "*****.С")
	(command "_TEXT" "_ML" (list (+ xpnt-ins 1) (- ypnt-ins 4)) 2.5 0 "Спецификация оборудования, изделий и материалов")
			
	(setvar	"OSMODE" 6199)
);while

(vla-endundomark adoc)
(setvar "CMDECHO" 1)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;/////// *************************************************************//////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////
;/////// *************************************************************//////////////////////////////

