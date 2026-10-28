
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun c:100-le-pages-header

( / adoc pnt-1 rctn-1 rctn-2 rctn-3 rctn-4 txt-1 txt-2 txt-3 txt-4)

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (= (tblsearch "block" "пэ-шапка" ) nil)
	(progn				; если данного блока нет
		(setvar	"OSMODE" 0)
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_RECTANGLE" '(-185 0) '(-165 -15))
		(setq rctn-1 (entlast))
		(command "_RECTANGLE" '(-165 0) '(-55 -15))
		(setq rctn-2 (entlast))
		(command "_RECTANGLE" '(-55 0) '(-45 -15))
		(setq rctn-3 (entlast))
		(command "_RECTANGLE" '(-55 0) '(0 -15))
		(setq rctn-4 (entlast))	
						
		(setvar "CELWEIGHT" -1)
		(command "_MTEXT" '(-180 0) "_H" 2.5 "_j" "_mc" '(-170 -15) "Поз. обозна- чение" "")
		(setq txt-1 (entlast))
		(command "_TEXT" "_MC" '(-110 -7.5) 2.5 0 "Наименование")
		(setq txt-2 (entlast))
		(command "_TEXT" "_MC" '(-50 -7.5) 2.5 0 "Кол.")
		(setq txt-3 (entlast))
		(command "_TEXT" "_MC" '(-22.5 -7.5) 2.5 0 "Примечание")
		(setq txt-4 (entlast))
				
		(command "_block" "пэ-шапка"  '(0 0)    rctn-1		rctn-2		rctn-3		rctn-4
		  txt-1		  txt-2		  txt-3		  txt-4 "")
); end progn
); end if

(setvar	"OSMODE" 6199)
(setq pnt-1 (getpoint "\nУкажите точку вставки\n"));setq

(command "_insert" "пэ-шапка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-1) ; если блок существует
		

(vla-endundomark adoc)	
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
