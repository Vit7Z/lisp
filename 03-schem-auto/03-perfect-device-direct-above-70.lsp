;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// ОУ прямое свыше 70                                           //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:03-perfect-device-direct-above-70
( / adoc angl angl-blck circle-1 circle-2 hatch-1 lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 lin-8 pnt-drct pnt-obj)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);undo

(setvar "osmode" 0)
(setvar "cmdecho" 0)
(setvar "auprec" 7)

(if	(= (tblsearch "block" "оу-прямое-3х-кран-св70-са") nil)
  (progn ; выполнение первого условия, блока нет, создаем и вставляем
    (setvar "CELWEIGHT" -1)
    (command "_circle" '(0 6) 0.5)
		(setq circle-1 (entlast))
		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))
		(command "_line" '(-1.5 3) '(1.5 3) "");вертик кран
		(setq lin-1 (entlast))
		(command "_line" '(-1.5 9) '(1.5 9) "")
		(setq lin-2 (entlast))
		(command "_line" '(-1.5 3) '(1.5 9) "")
		(setq lin-3 (entlast))
		(command "_line" '(1.5 3) '(-1.5 9) "")
		(setq lin-4 (entlast))
		
		(command "_line" '(0 6) '(3 7.5) "");треугольник сбоку
		(setq lin-5 (entlast))
		(command "_line" '(3 7.5) '(3 4.5) "")
		(setq lin-6 (entlast))
		(command "_line" '(3 4.5) '(0 6) "")
		(setq lin-7 (entlast))
		
		(setvar "CELWEIGHT" 60)
		(command "_line" '(0 0) '(0 3) "");ножка
		(setq lin-8 (entlast))
		(command "_circle" '(1 1.5) 1)
		(setq circle-2 (entlast))
		(setvar "CELWEIGHT" -1)
		(command "_block" "оу-прямое-3х-кран-св70-са" '(0 0)
		  circle-1 circle-2 hatch-1 lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 lin-8
		"");command
  ) ; конец progn
);if
(setvar "OSMODE" 6199)
(setq	pnt-obj (getpoint "\nУкажите точку\n")
      pnt-drct (getpoint "\nУкажите направление\n")
			angl (atoi (angtos (angle pnt-obj pnt-drct)));угол вставки
);setq

; опеределяем угол поворота и точки вставки
(cond
  ;вниз
  ((and (<= angl 315) (>= angl 225));and
    (setq angl-blck 0
          pnt-obj (polar pnt-obj (angtof "270" 1) 9)
    );setq
  );end условия
  
  ; влево
  ((and (<= angl 225) (>= angl 135));and
    (setq angl-blck 270
          pnt-obj (polar pnt-obj (angtof "180" 1) 9)
    );setq
	);end условия
	
  ; вверх
  ((and (<= angl 135) (>= angl 45));and
    (setq angl-blck 0
          pnt-obj (polar pnt-obj (angtof "270" 1) 9)
    );setq
	); end условия  	
	  
  ; вправо	
	(progn													
    (setq angl-blck 90
          pnt-obj (polar pnt-obj (angtof "0" 1) 9)
    );setq
	);progn
); end cond

(setvar "OSMODE" 0)
(command "_insert" "оу-прямое-3х-кран-св70-са" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-obj)

(vla-endundomark adoc)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(setvar "CMDECHO" 1)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////