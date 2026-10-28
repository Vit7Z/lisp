;///////////////////////////////панель инструментов//////////////////////////////////////////////////////
;///////////////////рисование выноски, первого позиционного обозначени€//////////////////////////////////
(defun c:09-cgv-itm-dsgn-01-frst

( / adoc circle-1 drctn-x drctn-y hatch-1 pnt-1 pnt-2 pnt-3 pnt-ins pnt-txt ss1 xpnt-2 xpnt-ins 
ypnt-2 ypnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "block" "точка-1мм" ) nil) ; рисуем точку на конце выноски
	(progn ;если блока нет, создаем
	  (command "_circle" '(0 0 ) 0.5)
	  (setq circle-1 (entlast))
	  (command "_hatch" "solid" circle-1 "")
	  (setq hatch-1 (entlast))
	  (command "_block" "точка-1мм" '(0 0 ) circle-1 hatch-1 "")
	);progn
);if

(setvar "osmode" 0)
(setvar "orthomode" 0)

(setq pnt-1 (getpoint "\n”кажите точку 1\n")
      ss1 (ssadd) ;пустой набор, дл€ линий
);setq

(command "_insert" "точка-1мм" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-1)

(setvar "osmode" 6199)

(while (/= (setq pnt-2 (getpoint "\n”кажите точку 2\n")) nil)
	(setq xpnt-2 (nth 0 pnt-2)
		  	ypnt-2 (nth 1 pnt-2)
	);setq
	
	(setvar "osmode" 0)
	(command "_line" pnt-1 pnt-2 "")
	
	(setq ss1 (ssadd (entlast) ss1));setq
	
	(setvar "osmode" 6199)
	(setq pnt-1 pnt-2);setq
);while

(if	(= pnt-2 nil)
  (setq pnt-2 pnt-1);setq
);if

(setq	pnt-ins (getpoint "\n”кажите направление полки\n") ; перва€ точка выноски 
      xpnt-ins (nth 0 pnt-ins)
      ypnt-ins (nth 1 pnt-ins)
      drctn-x (- xpnt-ins xpnt-2);направление вставки по горизонтали
			drctn-y (- ypnt-ins ypnt-2);направление вставки по горизонтали
);setq

(if (> drctn-x 0)
	(progn ;полка вправо
		(setq pnt-3 (list (+ xpnt-2 8) ypnt-2)
      		pnt-txt (list (+ xpnt-2 4) ypnt-2)
		);setq
	);progn

	(progn	;полка влево
		(setq pnt-3 (list (- xpnt-2 8) ypnt-2)
      		pnt-txt (list (- xpnt-2 4) ypnt-2)
		);setq
	);progn
);if

(setvar "osmode" 0)
(command "_line" pnt-2 pnt-3 "")
(setq ss1 (ssadd (entlast) ss1));setq

(setvar 'PEDITACCEPT 1)
(command "_pedit" "_M" ss1 "" "_J" "" "")
(setvar 'PEDITACCEPT 0)

(command "_TEXT" "_BC" pnt-txt 3.5 0 "***")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
(gc)
)
;///////////////////////////////////// конец программы ///////////////////////////////////