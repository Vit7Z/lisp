
;///////////////// рисование контакт замыкающий //////////////////////////
(defun c:04-cntct-closing

( / adoc angl angl-blck line-1 line-2 line-3 name-blck pnt-1 pnt-drct pnt-ins xpnt-ins ypnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(setq name-blck "контакт-НО-спэ");setq

(if	(= (tblsearch "block" name-blck) nil)
  (progn
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    (setq pnt-1 (polar '(2.625 0) (angtof "30" 0) 4.3301));setq
    (command "_line" '(0 0) '(2.625 0) "")
    (setq line-1 (entlast))
    (command "_line" '(2.625 0) pnt-1 "")
    (setq line-2 (entlast))
    (command "_line" '(6.38 0) '(9 0) "")
    (setq line-3 (entlast))
    (command "_block" name-blck '(0 0) line-1 line-2 line-3 "");command
  );progn
);if

(setvar "osmode" 6199)
(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
      xpnt-ins (nth 0 pnt-ins)
      ypnt-ins (nth 1 pnt-ins)
			pnt-drct (getpoint "\nУкажите направление\n")
			angl (atoi (angtos (angle pnt-ins pnt-drct))) ; угол вставки
);setq

; опеределяем угол поворота
(cond
  ; вверх
  ((and (<= angl 135) (>= angl 45));and
    (setq angl-blck 90); end setq
  );=
  
  ; влево
  ((and (<= angl 225) (>= angl 135));and
    (setq angl-blck 0
    			xpnt-ins (- xpnt-ins 9)
    			pnt-ins (list xpnt-ins ypnt-ins)
    );setq
	);=
	
  ; вниз
  ((and (<= angl 315) (>= angl 225));and
    (setq angl-blck 90
    			ypnt-ins (- ypnt-ins 9)
    			pnt-ins (list xpnt-ins ypnt-ins)
    );setq
	);=
	  
  ; вправо	
	(progn													
		(setq angl-blck 0);setq
	);progn
); end cond

(setvar "osmode" 0)
(command "_insert" name-blck "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(gc)
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////
