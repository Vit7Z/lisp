;//////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ЧРО, линия проводок видимая //////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:08-wiring-line-is-visible

( / adoc pnt1 pnt2)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "orthomode" 1)

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


(setq pnt1 (getpoint "Начало"));setq

(while (setq pnt2 (getpoint "След точка"));setq
  (setvar "osmode" 0)
  
	(entmakex
		(list
			'(0 . "LINE")
			'(100 . "AcDbLine")
			'(100 . "AcDbEntity")
			(cons 10 pnt1)
			(cons 11 pnt2)
			'(370 . 60)
			'(8 . "arngment-equip")
		);list
	);entmakex

  (setvar "osmode" 6199)
  (setq pnt1 pnt2);setq
);while

(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)
(gc)
)
;/////// конец программы /////////////////////////////////////////////////////////////////