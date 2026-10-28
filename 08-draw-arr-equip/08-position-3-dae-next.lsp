;///////////////////////////////панель инструментов//////////////////////////////////////////////////////
;///////////////////рисование выноски, нижнего позиционного обозначени€//////////////////////////////////
(defun c:08-position-3-dae-next

( / adoc dlt-x dlt-y line_1 line_2 pnt_1 pnt_2 pnt_3 pnt_txt ss1 txt xpnt_1 xpnt_3 ypnt_1 ypnt_3)

(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(if (= (tblsearch "layer" "arngment-equip") nil)
	(entmakex 
		'((0 . "LAYER")
  	(100 . "AcDbSymbolTableRecord")
  	(100 . "AcDbLayerTableRecord")
  	(2 . "arngment-equip")
  	(70 . 0) ;standard flags (bit-coded values): 1 = Layer is frozen
  	(62 . 4) ;color
  	(6 . "Continuous") ;linetype name
  	(290 . 1) ;plotting flag. If set to 0, do not plot this layer
  	(370 . -1)) ;lineweight enum value; line wide 0
	);entmakex
);if

(setvar "clayer" "arngment-equip")

(while (/= (setq pnt_1 (getpoint "\n”кажите точку\n")) nil)
	
	(setq xpnt_1 (nth 0 pnt_1)
				ypnt_1 (nth 1 pnt_1)
	);setq
	
	(setvar "osmode" 0)
	
	(setq	pnt_3 (getpoint "\n”кажите направление полки\n") ; перва€ точка выноски 
				xpnt_3 (nth 0 pnt_3)
				ypnt_3 (nth 1 pnt_3)
	);setq
	
	(cond
		((> xpnt_1 xpnt_3) (setq dlt-x -6));=, полка вправо
		((< xpnt_1 xpnt_3) (setq dlt-x 6));=, полка влево
	);cond
	
	(cond
		((> ypnt_1 ypnt_3) (setq dlt-y -6));=
		((< ypnt_1 ypnt_3) (setq dlt-y 6));=
	);cond
	
	
	(setq pnt_2 (list xpnt_1 (+ ypnt_1 dlt-y))
				pnt_3 (list (+ xpnt_1 dlt-x) (+ ypnt_1 dlt-y))
				pnt_txt (list (+ xpnt_1 (/ dlt-x 2)) (+ ypnt_1 dlt-y))
	);setq
	
	(setvar "osmode" 0)
	
	(command "_line" pnt_1 pnt_2 "")
	(setq line_1 (entlast))
	
	(command "_line" pnt_2 pnt_3 "")
	(setq line_2 (entlast))
	
	;;;;;;;объединение отрезков в одну полилинию
	(setvar 'PEDITACCEPT 1)
	
	(setq	ss1 (ssadd)			
				ss1 (ssadd line_1 ss1)
				ss1 (ssadd line_2 ss1)
	);setq
	
	(command "_pedit" "_M" ss1 "" "_J" "" "")
	
	(setvar 'PEDITACCEPT 0)
	
	(command "_TEXT" "_BC" pnt_txt 3 0 "***")
	
	(setvar "osmode" 6199)
);while

(vla-endundomark adoc)

(setvar "cmdecho" 1)
(setvar "clayer" "0")

(princ)
(gc)
)
;///////////////////////////////////// конец программы ///////////////////////////////////

