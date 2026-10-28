;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// ОУ для импульсных линий                                      //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:03-perfect-device-pulse-lines
( / adoc angl angl-blck celwght-old circle-1 hatch-1 lin-1 lin-2 lin-3 lin-4 lin-8 pnt-drct pnt-ins xpnt-ins ypnt-ins)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
) ; start undo

(setvar "osmode" 0)
(setvar "cmdecho" 0)
(setvar "auprec" 7)

(if	(= (tblsearch "block" "оу-для-импульс-лин-са") nil)
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
		
		(setvar "CELWEIGHT" 60)
		(command "_line" '(0 0) '(0 3) "");ножка
		(setq lin-8 (entlast))
		(setvar "CELWEIGHT" -1)
		(command "_block" "оу-для-импульс-лин-са" '(0 0)
		  circle-1 hatch-1 lin-1 lin-2 lin-3 lin-4 lin-8
		"");command
  ) ; конец progn
);if	
(setvar "OSMODE" 6199)
(setq	pnt-obj (getpoint "\nУкажите точку\n")
      pnt-drct (getpoint "\nУкажите направление\n")
			angl (atoi (angtos (angle pnt-obj pnt-drct))) ; угол вставки
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
(command "_insert" "оу-для-импульс-лин-са" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-obj)

(vla-endundomark adoc)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(setvar "CMDECHO" 1)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////
