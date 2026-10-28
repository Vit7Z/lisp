
;///////////////// рисование кнопка размыкающа€, с возвратом //////////////////////////
(defun c:04-button-disconnecting

( / angl angl-blck line-1 line-2 line-3 line-4 line-5 line-6 line-7 pnt-1 pnt-drct pnt-ins xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)
(command "_.undo" "_begin")

(if	(= (tblsearch "block" "кнопка-размык-с-возвратом-спэ") nil)
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
    (setq line-4 (entlast))   
    
    (command "_line" '(4 3) '(4 1) "")
    (setq line-5 (entlast))
    
    (command "_line" '(5 3) '(5 1) "")
    (setq line-6 (entlast))
    
    (command "_extend" line-2 "" line-5 line-6 "") ;удлин€ем линии
    (command "_line" '(2.5 3) '(6.5 3) "");линии кнопочки гориз (пимпочки)
    (setq line-7 (entlast))
    
    (command "_block" "кнопка-размык-с-возвратом-спэ" '(0 0) line-1 line-2 line-3 line-5 line-6 line-7 "");command
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
  ;вверх
  ((and (<= angl 135) (>= angl 45));and
    (setq angl-blck 90);setq
  );=
  
  ;влево
  ((and (<= angl 225) (>= angl 135));and
    (setq angl-blck 0
          pnt-ins (list (- xpnt-ins 12) ypnt-ins)
    );setq
	);=
	
  ;вниз
  ((and (<= angl 315) (>= angl 225));and
    (setq angl-blck 90
          pnt-ins (list xpnt-ins (- ypnt-ins 12))
    );setq
	);=
	  
  ;вправо	
	(progn													
		(setq angl-blck 0);setq
	);progn
);cond

(setvar "osmode" 0)
(command "_insert" "кнопка-размык-с-возвратом-спэ" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(command "_.undo" "_end")
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////
