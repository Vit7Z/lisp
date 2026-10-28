
;///////////////// рисование кнопка замыкающа€, с возвратом //////////////////////////
(defun c:04-button-closing

( / adoc angl angl-blck line-1 line-2 line-3 line-4 line-5 line-6 pnt-1 pnt-drct pnt-ins xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(if	(= (tblsearch "block" "кнопка-замык-с-возвратом-спэ") nil)
  (progn
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    (setq pnt-1 (polar '(2.625 0) (angtof "30" 0) 4.3301));setq
    
    (command "_line" '(0 0) '(2.625 0) "")
    (setq line-1 (entlast))
    (command "_line" '(2.625 0) pnt-1 "");наклонна€ лини€
    (setq line-2 (entlast))
    (command "_line" '(6.38 0) '(9 0) "")
    (setq line-3 (entlast))
    
    (command "_line" '(4 3) '(4 2) "");линии кнопочки верт
    (setq line-4 (entlast))
    (command "_line" '(5 3) '(5 2) "")
    (setq line-5 (entlast))
    (command "_extend" line-2 "" line-4 line-5 "") ;удлин€ем линии
    (command "_line" '(2.5 3) '(6.5 3) "");линии кнопочки гориз
    (setq line-6 (entlast))
    
    (command "_block" "кнопка-замык-с-возвратом-спэ" '(0 0) line-1 line-2 line-3 line-4 line-5 line-6 "");command
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
          pnt-ins (list (- xpnt-ins 9) ypnt-ins)
    );setq
	);=
  															 
  ((and (<= angl 315) (>= angl 225));вниз
    (setq angl-blck 90
          pnt-ins (list xpnt-ins (- ypnt-ins 9))
    );setq
	);=
	  
	(progn													
		(setq angl-blck 0);вправо
	);progn
); end cond

(setvar "osmode" 0)
(command "_insert" "кнопка-замык-с-возвратом-спэ" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(vla-endundomark adoc)
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////
