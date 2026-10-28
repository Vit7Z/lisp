
;///////////////// рисование автоматического выключател€ трехполюсного вертикально //////////////////////////
(defun c:04-auto-swtch-3-p-v

( / line-1 line-10 line-11 line-12 line-13 line-14 line-2 line-3 line-4 line-5 line-6 line-7 line-8 line-9 pnt-1 pnt-11 pnt-2 pnt-ins xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(if	(= (tblsearch "block" "авт-выкл-3пол-спэ") nil)
  (progn 
    (setq	pnt-1 (polar '(0 -6.38) (angtof "120" 0) 1.5)
					pnt-2 (polar '(0 -6.38) (angtof "120" 0) 3)
		);setq
		
		(setvar "osmode" 0)
		(command "_line" '(0 0) '(0 -2.625) "");фаза 1
		(setq line-1 (entlast))
		(command "_line" '(0 -6.38) (polar '(0 -6.38) (angtof "120" 0) 4.3301) "")
		(setq line-2 (entlast))
		(command "_line" '(0 -6.38) '(0 -9) "")
		(setq line-3 (entlast))
		(command "_line" '(5 0) '(5 -2.625) "");фаза 2
		(setq line-4 (entlast))
		(command "_line" '(5 -6.38) (polar '(5 -6.38) (angtof "120" 0) 4.3301) "")
		(setq line-5 (entlast))
		(command "_line" '(5 -6.38) '(5 -9) "")
		(setq line-6 (entlast))
		(command "_line" '(10 0) '(10 -2.625) "");фаза 3
		(setq line-7 (entlast))
		(command "_line" '(10 -6.38) (polar '(10 -6.38) (angtof "120" 0) 4.3301) "")
		(setq line-8 (entlast))
		(command "_line" '(10 -6.38) '(10 -9) "")
		(setq line-9 (entlast))
		(command "_line" (polar '(0 -6.38) (angtof "120" 0) 1.5) (polar '(10 -6.38) (angtof "120" 0) 1.5) "");отрезки горизонтальные
		(setq line-10 (entlast))
		(command "_line" (polar '(0 -6.38) (angtof "120" 0) 3) (polar '(10 -6.38) (angtof "120" 0) 3) "")
		(setq line-11 (entlast))
		(command "_line" (polar '(0 -6.38) (angtof "120" 0) 1.5) (polar pnt-1 (angtof "210" 0) 1.5) "");кнопочка
		(setq line-12 (entlast))
		(command "_line" (polar '(0 -6.38) (angtof "120" 0) 3) (polar pnt-2 (angtof "210" 0) 1.5) "")
		(setq line-13 (entlast))
		(command "_line" (polar pnt-1 (angtof "210" 0) 1.5) (polar pnt-2 (angtof "210" 0) 1.5) "")
		(setq line-14 (entlast))

		(command "_block" "авт-выкл-3пол-спэ" '(0 0)
			       line-1 line-2 line-3 line-4 line-5 line-6 line-7 line-8 line-9 line-10 line-11 line-12 line-13 line-14 ""
		);command
  );progn
);if

(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\n”кажите точку вставки\n")
      xpnt-ins (nth 0 pnt-ins)
      ypnt-ins (nth 1 pnt-ins)
      pnt-11 (list (- xpnt-ins 2.799) (- ypnt-ins 4.53192))	; точка вставки поз обозначени€
);setq

(command "_insert" "авт-выкл-3пол-спэ" "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)

(setvar "osmode" 0)
(command "_text" "_mr" pnt-11 2.5 0 "SF****")

(vla-endundomark adoc)
(setvar "orthomode" 1)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////

