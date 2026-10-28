;;;; /////////////////////////рисование экрана кабел€, выбор направлени€ /////////////////////////////////////
(defun c:05-cbl-shld-cble-02

( / adoc angl arc-1 arc1-angl1 arc1-angl2 arc1-pnt-cntr arc-2 arc2-angl1 arc2-angl2 arc2-pnt-cntr blck-pnt1 
circle-1 hatch-1 line-1 line-2 line-3 line-4 ln1-pnt1 ln1-pnt2 ln2-pnt1 ln2-pnt2 ln3-pnt1 ln3-pnt2 ln4-pnt1 
ln4-pnt2 pi pnt-drct pnt-ins-1 pnt-ins-2 pnt-m ss1 ss2 x-pnt-drct x-pnt-ins-1 x-pnt-ins-2 x-pnt-m y-pnt-drct 
y-pnt-ins-1 y-pnt-ins-2 y-pnt-m)

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if	(= (tblsearch "block" "точка-1мм") nil)
  (progn 
	  (command "_circle" '(0 0) 0.5)
		(setq circle-1 (entlast))
		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))
		(command "_block" "точка-1мм" '(0 0) circle-1 hatch-1 "")
	);progn
);if

(setvar "osmode" 6199)

(setq pnt-ins-1 (getpoint "\n”кажите точку 1 жилы\n")
			x-pnt-ins-1 (nth 0 pnt-ins-1)
			y-pnt-ins-1 (nth 1 pnt-ins-1)

			pnt-ins-2 (getpoint "\n”кажите точку экрана\n")
			x-pnt-ins-2 (nth 0 pnt-ins-2)
			y-pnt-ins-2 (nth 1 pnt-ins-2)

			pnt-drct (getpoint "\n”кажите направление\n")
			x-pnt-drct (nth 0 pnt-drct)
      y-pnt-drct (nth 1 pnt-drct)

			x-pnt-m (* 0.5 (+ x-pnt-ins-1 x-pnt-ins-2))
			y-pnt-m (* 0.5 (+ y-pnt-ins-1 y-pnt-ins-2))
			pnt-m (list x-pnt-m y-pnt-m)

			angl (atoi (angtos (angle pnt-m pnt-drct)))
			
			pi 3.1415926535
);setq


(if (= (tblsearch "ltype" "acad_iso02w100" t) nil)
  (command "_.linetype" "_l" "acad_iso02w100" "acadiso.lin" "")
);if


(if (and (> angl 45) (<= angl 135) 
				 (> x-pnt-ins-2 x-pnt-ins-1));вверх, вправо
    
  (setq arc1-pnt-cntr (list x-pnt-ins-1 (+ y-pnt-ins-1 4))
				arc1-angl1 (* 0.5 pi)
				arc1-angl2 (+ arc1-angl1 pi)

				arc2-pnt-cntr (list (- x-pnt-ins-2 5) (+ y-pnt-ins-1 4))
				arc2-angl1 (+ arc1-angl1 pi)
				arc2-angl2 (* 0.5 pi)

				ln1-pnt1 (list x-pnt-ins-1 (+ y-pnt-ins-1 5))
				ln1-pnt2 (list (- x-pnt-ins-2 5) (+ y-pnt-ins-1 5))

				ln2-pnt1 (list x-pnt-ins-1 (+ y-pnt-ins-1 3))
				ln2-pnt2 (list (- x-pnt-ins-2 5) (+ y-pnt-ins-1 3))
				
				ln3-pnt1 (list (- x-pnt-ins-2 4) (+ y-pnt-ins-1 4))
				ln3-pnt2 (list x-pnt-ins-2 (+ y-pnt-ins-1 4))
				
				ln4-pnt1 (list x-pnt-ins-2 (+ y-pnt-ins-1 4))
				ln4-pnt2 pnt-ins-2
				
				blck-pnt1 ln3-pnt1
  );setq
);if


(if (and (> angl 45) (<= angl 135)
				 (< x-pnt-ins-2 x-pnt-ins-1));вверх, влево
      
  (setq arc1-pnt-cntr (list x-pnt-ins-1 (+ y-pnt-ins-1 4))
				arc1-angl1 (* 1.5 pi)
				arc1-angl2 (+ arc1-angl1 pi)

				arc2-pnt-cntr (list (+ x-pnt-ins-2 5) (+ y-pnt-ins-1 4))
				arc2-angl1 (* 0.5 pi)
				arc2-angl2 (+ arc2-angl1 pi)

				ln1-pnt1 (list x-pnt-ins-1 (+ y-pnt-ins-1 5))
				ln1-pnt2 (list (+ x-pnt-ins-2 5) (+ y-pnt-ins-1 5))

				ln2-pnt1 (list x-pnt-ins-1 (+ y-pnt-ins-1 3))
				ln2-pnt2 (list (+ x-pnt-ins-2 5) (+ y-pnt-ins-1 3))
				
				ln3-pnt1 (list (+ x-pnt-ins-2 4) (+ y-pnt-ins-1 4))
				ln3-pnt2 (list x-pnt-ins-2 (+ y-pnt-ins-1 4))
				
				ln4-pnt1 (list x-pnt-ins-2 (+ y-pnt-ins-1 4))
				ln4-pnt2 pnt-ins-2
				
				blck-pnt1 ln3-pnt1
  );setq
);if


(if (and (> angl 135) (< angl 225)
      	 (< y-pnt-ins-1 y-pnt-ins-2));влево, вверх
      	 
  (setq arc1-pnt-cntr (list (- x-pnt-ins-1 4) y-pnt-ins-1)
				arc1-angl1 pi
				arc1-angl2 (- arc1-angl1 pi)

				arc2-pnt-cntr (list (- x-pnt-ins-1 4) (- y-pnt-ins-2 5))
				arc2-angl1 0
				arc2-angl2 (+ arc2-angl1 pi)

				ln1-pnt1 (list (- x-pnt-ins-1 5) y-pnt-ins-1)
				ln1-pnt2 (list (- x-pnt-ins-1 5) (- y-pnt-ins-2 5))

				ln2-pnt1 (list (- x-pnt-ins-1 3) y-pnt-ins-1)
				ln2-pnt2 (list (- x-pnt-ins-1 3) (- y-pnt-ins-2 5))
				
				ln3-pnt1 (list (- x-pnt-ins-2 4) (- y-pnt-ins-2 4))
				ln3-pnt2 (list (- x-pnt-ins-2 4) y-pnt-ins-2)
				
				ln4-pnt1 (list (- x-pnt-ins-2 4) y-pnt-ins-2)
				ln4-pnt2 pnt-ins-2
				
				blck-pnt1 ln3-pnt1
  );setq
);if


(if (and (> angl 135) (< angl 225) 
      	 (> y-pnt-ins-1 y-pnt-ins-2));влево, вниз
      
  (setq arc1-pnt-cntr (list (- x-pnt-ins-1 4) y-pnt-ins-1)
				arc1-angl1 0
				arc1-angl2 (+ arc1-angl1 pi)

				arc2-pnt-cntr (list (- x-pnt-ins-1 4) (+ y-pnt-ins-2 5))
				arc2-angl1 pi
				arc2-angl2 (+ arc2-angl1 pi)

				ln1-pnt1 (list (- x-pnt-ins-1 5) y-pnt-ins-1)
				ln1-pnt2 (list (- x-pnt-ins-1 5) (+ y-pnt-ins-2 5))

				ln2-pnt1 (list (- x-pnt-ins-1 3) y-pnt-ins-1)
				ln2-pnt2 (list (- x-pnt-ins-1 3) (+ y-pnt-ins-2 5))
				
				ln3-pnt1 (list (- x-pnt-ins-2 4) (+ y-pnt-ins-2 4))
				ln3-pnt2 (list (- x-pnt-ins-2 4) y-pnt-ins-2)
				
				ln4-pnt1 (list (- x-pnt-ins-2 4) y-pnt-ins-2)
				ln4-pnt2 pnt-ins-2
				
				blck-pnt1 ln3-pnt1
  );setq
);if 


(if (and (> angl 225) (< angl 315) 
      	 (> x-pnt-ins-2 x-pnt-ins-1));вниз, вправо
      	 
  (setq arc1-pnt-cntr (list x-pnt-ins-1 (- y-pnt-ins-1 4))
				arc1-angl1 (* 0.5 pi)
				arc1-angl2 (+ arc1-angl1 pi)

				arc2-pnt-cntr (list (- x-pnt-ins-2 5) (- y-pnt-ins-1 4))
				arc2-angl1 (+ arc1-angl1 pi)
				arc2-angl2 (* 0.5 pi)

				ln1-pnt1 (list x-pnt-ins-1 (- y-pnt-ins-1 5))
				ln1-pnt2 (list (- x-pnt-ins-2 5) (- y-pnt-ins-1 5))

				ln2-pnt1 (list x-pnt-ins-1 (- y-pnt-ins-1 3))
				ln2-pnt2 (list (- x-pnt-ins-2 5) (- y-pnt-ins-1 3))
				
				ln3-pnt1 (list (- x-pnt-ins-2 4) (- y-pnt-ins-1 4))
				ln3-pnt2 (list x-pnt-ins-2 (- y-pnt-ins-1 4))
				
				ln4-pnt1 (list x-pnt-ins-2 (- y-pnt-ins-1 4))
				ln4-pnt2 pnt-ins-2
				
				blck-pnt1 ln3-pnt1
  );setq
);if 


(if (and (> angl 225) (< angl 315)
      	 (< x-pnt-ins-2 x-pnt-ins-1));вниз, влево

  (setq arc1-pnt-cntr (list x-pnt-ins-1 (- y-pnt-ins-1 4))
				arc1-angl1 (* 1.5 pi)
				arc1-angl2 (+ arc1-angl1 pi)

				arc2-pnt-cntr (list (+ x-pnt-ins-2 5) (- y-pnt-ins-1 4))
				arc2-angl1 (* 0.5 pi)
				arc2-angl2 (+ arc2-angl1 pi)

				ln1-pnt1 (list x-pnt-ins-1 (- y-pnt-ins-1 5))
				ln1-pnt2 (list (+ x-pnt-ins-2 5) (- y-pnt-ins-1 5))

				ln2-pnt1 (list x-pnt-ins-1 (- y-pnt-ins-1 3))
				ln2-pnt2 (list (+ x-pnt-ins-2 5) (- y-pnt-ins-1 3))
				
				ln3-pnt1 (list (+ x-pnt-ins-2 4) (- y-pnt-ins-1 4))
				ln3-pnt2 (list x-pnt-ins-2 (- y-pnt-ins-1 4))
				
				ln4-pnt1 (list x-pnt-ins-2 (- y-pnt-ins-1 4))
				ln4-pnt2 pnt-ins-2
				
				blck-pnt1 ln3-pnt1
  );setq
);if 


(if (and (or (< angl 45) (> angl 315))     
      	 		 (< y-pnt-ins-1 y-pnt-ins-2));вправо, вверх

  (setq arc1-pnt-cntr (list (+ x-pnt-ins-1 4) y-pnt-ins-1)
				arc1-angl1 pi
				arc1-angl2 (- arc1-angl1 pi)

				arc2-pnt-cntr (list (+ x-pnt-ins-1 4) (- y-pnt-ins-2 5))
				arc2-angl1 0
				arc2-angl2 (+ arc2-angl1 pi)

				ln1-pnt1 (list (+ x-pnt-ins-1 5) y-pnt-ins-1)
				ln1-pnt2 (list (+ x-pnt-ins-1 5) (- y-pnt-ins-2 5))

				ln2-pnt1 (list (+ x-pnt-ins-1 3) y-pnt-ins-1)
				ln2-pnt2 (list (+ x-pnt-ins-1 3) (- y-pnt-ins-2 5))
				
				ln3-pnt1 (list (+ x-pnt-ins-2 4) (- y-pnt-ins-2 4))
				ln3-pnt2 (list (+ x-pnt-ins-2 4) y-pnt-ins-2)
				
				ln4-pnt1 (list (+ x-pnt-ins-2 4) y-pnt-ins-2)
				ln4-pnt2 pnt-ins-2
				
				blck-pnt1 ln3-pnt1
  );setq
);if 


(if (and (or (< angl 45) (> angl 315))
     		 (> y-pnt-ins-1 y-pnt-ins-2));вправо, вниз
     		 
  (setq arc1-pnt-cntr (list (+ x-pnt-ins-1 4) y-pnt-ins-1)
				arc1-angl1 0
				arc1-angl2 (- arc1-angl1 pi)

				arc2-pnt-cntr (list (+ x-pnt-ins-1 4) (+ y-pnt-ins-2 5))
				arc2-angl1 pi
				arc2-angl2 (+ arc2-angl1 pi)

				ln1-pnt1 (list (+ x-pnt-ins-1 5) y-pnt-ins-1)
				ln1-pnt2 (list (+ x-pnt-ins-1 5) (+ y-pnt-ins-2 5))

				ln2-pnt1 (list (+ x-pnt-ins-1 3) y-pnt-ins-1)
				ln2-pnt2 (list (+ x-pnt-ins-1 3) (+ y-pnt-ins-2 5))
				
				ln3-pnt1 (list (+ x-pnt-ins-2 4) (+ y-pnt-ins-2 4))
				ln3-pnt2 (list (+ x-pnt-ins-2 4) y-pnt-ins-2)
				
				ln4-pnt1 (list (+ x-pnt-ins-2 4) y-pnt-ins-2)
				ln4-pnt2 pnt-ins-2
				
				blck-pnt1 ln3-pnt1
  );setq
);if 


(setvar "osmode" 0)									 
(setvar "celtscale" 0.1)
(setvar "celtype" "acad_iso02w100")

(setq arc-1
	(entmakex (list
	'(0 . "ARC")
	'(100 . "AcDbCircle")
	'(100 . "AcDbArc")

	(cons 10 arc1-pnt-cntr) 
	'(40 . 1.0);радиус
	'(8 . "0") ; слой
	(cons 50  arc1-angl1);start angle
	(cons 51  arc1-angl2);end angle
	));entmakex
);setq

(setq arc-2
	(entmakex (list
	'(0 . "ARC")
	'(100 . "AcDbCircle")
	'(100 . "AcDbArc")

	(cons 10 arc2-pnt-cntr) 
	'(40 . 1.0);радиус
	'(8 . "0") ; слой
	(cons 50  arc2-angl1);start angle
	(cons 51  arc2-angl2);end angle
	));entmakex
);setq

(command "_line" ln1-pnt1 ln1-pnt2 "")

(setq line-1 (entlast))

(command "_line" ln2-pnt1 ln2-pnt2 "")

(setq line-2 (entlast))

(command "_line" ln3-pnt1 ln3-pnt2 "")

(setq line-3 (entlast))

(command "_line" ln4-pnt1 ln4-pnt2 "")

(setq line-4 (entlast))

;;;;;;;объединение отрезков в одну полилинию
(setvar 'PEDITACCEPT 1)

(setq	ss1 (ssadd)
			ss1 (ssadd arc-1 ss1)
			ss1 (ssadd arc-2 ss1)
			
			ss1 (ssadd line-1 ss1)
			ss1 (ssadd line-2 ss1)
);setq

(setq	ss2 (ssadd)
			ss2 (ssadd line-3 ss2)
			ss2 (ssadd line-4 ss2)
);setq

(command "_pedit" "_M" ss1 "" "_J" "" "")

(command "_pedit" "_M" ss2 "" "_J" "" "")

(setvar 'PEDITACCEPT 0)



(setvar "celtscale" 1)
(setvar "celtype" "ByLayer")

(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 blck-pnt1)

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(princ)
)
;;;; /////////////////////// конец программы /////////////////////////////////////////