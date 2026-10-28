;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование конца трубы                                        //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:699-pipeend

( / adoc angl-direct angl-grad angl-rad angl-tmp arc-1 arc-2 arc-3 dist-1 dist-div-4 half pi pnt-1 pnt-2 pnt-3 pnt-arc1-m pnt-arc2-m 
pnt-arc3-m pnt-mdl pnt-tmp ss1 xpnt-1 xpnt-2 ypnt-1 ypnt-2)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setq	pnt-1 (getpoint "\n”кажите 1 точку (закрашено)\n")
	    pnt-2 (getpoint "\n”кажите 2 точку\n")
	    xpnt-1 (nth 0 pnt-1)
			ypnt-1 (nth 1 pnt-1)
			xpnt-2 (nth 0 pnt-2)
			ypnt-2 (nth 1 pnt-2)
			
			pnt-mdl (list (* (+ xpnt-1 xpnt-2) 0.5) (* (+ ypnt-1 ypnt-2) 0.5))
      dist-1 (abs (distance pnt-2 pnt-1))
      dist-div-4 (/ dist-1 4)
      
      angl-rad (angle pnt-1 pnt-2)
  		  		
  		ss1 (ssadd) ;пустой набор, куда будут собиратьс€ нарисованные примитивы
);setq

(setvar "osmode" 0)
(setq	pnt-3 (getpoint "\n”кажите точку направлени€\n")
			pi 3.1415926535
);setq

(if (<= dist-1 1)
  (setq half 0.08);setq
);if

(if (and (> dist-1 1) (<= dist-1 3))
  (setq half 0.2);setq
);if

(if (and (> dist-1 3) (<= dist-1 10))
  (setq half 0.5);setq
);if

(if (> dist-1 10)
  (setq half 1.6);setq
);if

;дуга лева€ верхн€€
(setq pnt-tmp (polar pnt-1 angl-rad dist-div-4)
      pnt-arc1-m (polar pnt-tmp (+ angl-rad (/ pi 2)) half)
);setq

(command "_.arc" pnt-1 pnt-arc1-m pnt-mdl)
(setq arc-1 (entlast))

;дуга лева€ нижн€€
(setq pnt-arc2-m (polar pnt-tmp (+ angl-rad (* pi 1.5)) half));setq

(command "_.arc" pnt-1 pnt-arc2-m pnt-mdl)
(setq arc-2 (entlast))

(command "_hatch" "solid" arc-1 arc-2 "")
(setq ss1 (ssadd arc-2 ss1));setq

;дуга права€ верхн€€
(setq angl-direct (atof (angtos (angle pnt-mdl pnt-3) 0 5))
      angl-grad (atof (angtos angl-rad 0 5))
      angl-tmp (abs (- angl-direct angl-grad))
);setq

(if (<= angl-grad 90)
  (if (or (>= angl-direct 180) (<= angl-direct 90)) ;
    (setq pi (* pi 3));setq
  );if
);if

(if (and (> angl-grad 90) (<= angl-grad 180))
  (if (and (>= angl-direct 0) (<= angl-direct 180))
    (setq pi (* pi 3));setq
  );if
);if

(if (and (> angl-grad 180) (<= angl-grad 270))
  (if (and (>= angl-direct 90) (<= angl-direct 270))
    (setq pi (* pi 3));setq
  );if
);if

(if (and (> angl-grad 270) (< angl-grad 360))
  (if (>= angl-direct 180)
    (setq pi (* pi 3));setq
  );if
);if

;(princ "\n       angl-grad = ") (princ angl-grad);Erase_DV
;(princ "\n     angl-direct = ") (princ angl-direct);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

(setq pnt-tmp (polar pnt-mdl angl-rad dist-div-4)
      pnt-arc3-m (polar pnt-tmp (+ angl-rad (/ pi 2)) half)
);setq

(command "_.arc" pnt-mdl pnt-arc3-m pnt-2)

(setq arc-3 (entlast))
(setq ss1 (ssadd arc-3 ss1));setq

;;;;;;;объединение отрезков в одну полилинию
(setvar 'PEDITACCEPT 1)
(command "_pedit" "_M" ss1 "" "_J" "" "")
(setvar 'PEDITACCEPT 0)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////
