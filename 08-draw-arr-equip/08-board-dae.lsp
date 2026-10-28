;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// отрисовка шкафа на чро                                       //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:08-board-dae

( / adoc pnt-ins-blck rctngl-1 rctngl-2)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

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

(if (= (tblsearch "block" "шкаф-1-сторон-чро" ) nil)
	(progn
		(command "_.RECTANGLE" '(0 0) '(12 6))
		(setq rctngl-1 (entlast))
		(command "_.RECTANGLE" '(0 6) '(12 5))
		(setq rctngl-2 (entlast))
		(command "_block" "шкаф-1-сторон-чро" '(0 0) rctngl-1 rctngl-2 "")
	);progn
);if

(setvar "clayer" "0")
(setvar "osmode" 6199)

(while (/= (setq pnt-ins-blck (getpoint "\nУкажите точку вставки\n")) nil)
	(setvar "osmode" 0)
	(setvar "ORTHOMODE" 1)
	(command "_insert" "шкаф-1-сторон-чро" "_X" 1 "_Y" 1 "_Z" 1 pnt-ins-blck pause)

	(setvar "osmode" 6199)
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
(gc)
)
;/////// конец программы ///////
