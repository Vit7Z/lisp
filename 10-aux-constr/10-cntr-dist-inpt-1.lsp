;/////////////////// рисование контура на рассто€нии мм от крайних точек, рассто€ние вводитс€ с клавиатуры ////////////////////////////////
(defun c:10-cntr-dist-inpt-1

( / dist pnt-1 pnt-2 pnt-3 pnt-4 rctn-1 x-2 x-4 y-1 y-3)
  
(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(if (= (tblsearch "layer" "wspom") nil)
	(entmakex 
		'((0 . "LAYER")
  	(100 . "AcDbSymbolTableRecord")
  	(100 . "AcDbLayerTableRecord")
  	(2 . "wspom")
  	(70 . 0) ;standard flags (bit-coded values): 1 = Layer is frozen
  	(62 . 3) ;color
  	(6 . "Continuous") ;linetype name
  	(290 . 1) ;plotting flag. If set to 0, do not plot this layer
  	(370 . -1)) ;lineweight enum value; line wide 0
	);entmakex
);if

(setq	pnt-1 (getpoint "\n”кажите крайнюю верхнюю точку\n")         
			pnt-2 (getpoint "\n”кажите крайнюю левую точку\n")       
			pnt-3 (getpoint "\n”кажите крайнюю нижнюю точку\n")
			pnt-4 (getpoint "\n”кажите крайнюю правую точку\n")
			dist	(getint "\n”кажите рассто€ние\n")
);setq

(setq	y-1 (+ (nth 1 pnt-1) dist)
      x-2 (- (nth 0 pnt-2) dist)
      x-4 (+ (nth 0 pnt-4) dist)
			y-3 (- (nth 1 pnt-3) dist)
			
			pnt-1 (list x-2 y-1)
			pnt-4 (list x-4 y-3)
);setq

(setvar "osmode" 0)

(command "_layer" "”становить" "wspom" "")

(setvar "osmode" 0)
(command "_rectangle" pnt-1 pnt-4)

(command "_layer" "”становить" "0" "")
(setvar "osmode" 6199)
(setvar "cmdecho" 0)
(princ)
(gc)
)
; /////// конец программы /////////////////////////////////////////////////////////////////////////////////////////////////////////////////