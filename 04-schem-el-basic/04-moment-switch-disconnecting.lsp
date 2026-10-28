
;///////////////// рисование конечный выключатель размыкающий //////////////////////////
(defun c:04-moment-switch-disconnecting

( / angl angl-blck circle-1 line-1 line-2 line-3 line-4 line-5 name-blck pnt-1 pnt-drct pnt-ins xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq name-blck "выкл-моментный-размык-спэ");setq

(if	(= (tblsearch "block" name-blck) nil)
  (progn
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    (setq pnt-1 (polar '(2.625 0) (angtof "330" 0) 4.3301));setq
    (command "_line" '(0 0) '(2.625 0) "")
    (setq line-1 (entlast))
    (command "_line" '(2.625 0) pnt-1 "")
    (setq line-2 (entlast))
    (command "_line" '(6.38 0) '(9 0) "")
    (setq line-3 (entlast))
    (command "_line" '(6.38 0) '(6.38 -2.3) "")
    (setq line-5 (entlast))
    (command "_line" '(4.5 1) '(4.5 0) "")
    (setq line-4 (entlast))
    (command "_extend" line-2 "" line-4 "") ;удлин€ем линию
    (command "_circle" '(4.5 1.5) 0.5 "")
    (setq circle-1 (entlast))
    
    (command "_block" name-blck '(0 0) line-1 line-2 line-3 line-4 line-5 circle-1 "");command
  );progn
);if
(setvar "osmode" 6199)
(setq	pnt-ins (getpoint "\n”кажите точку вставки\n")
      xpnt-ins (nth 0 pnt-ins)
      ypnt-ins (nth 1 pnt-ins)
			pnt-drct (getpoint "\n”кажите направление\n")
			angl (atoi (angtos (angle pnt-ins pnt-drct))) ; угол вставки
);setq

; опередел€ем угол поворота
(cond
  ((and (<= angl 135) (>= angl 45));вверх
    (setq angl-blck 90);setq
  );=
   															 
  ((and (<= angl 225) (>= angl 135));влево
    (setq angl-blck 0
          pnt-ins (list (- xpnt-ins 12) ypnt-ins)
    );setq
	);=
	
  ; вниз
  ((and (<= angl 315) (>= angl 225));and
    (setq angl-blck 90
          pnt-ins (list xpnt-ins (- ypnt-ins 12))
    );setq
	);=
	  
  ; вправо	
	(progn													
		(setq angl-blck 0);setq
	);progn
);cond

(setvar "osmode" 0)
(command "_insert" name-blck "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(vla-endundomark adoc)

(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////
