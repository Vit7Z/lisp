;//////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// шапка спецификации чро ///////////////////////////////////////////////////////////////////////////////
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:08-head-spcf-dae

( / adoc pnt-1 rctn-1 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 txt-1 txt-2 txt-3 txt-4 txt-5 txt-6)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "CMDECHO" 0)

(if (= (tblsearch "block" "чро-шапка-спцф" ) nil)
	(progn				;если данного блока нет
		(setvar "OSMODE" 0)

		(setvar "CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_RECTANGLE" '(-185 0) '(-170 -15))
		(setq rctn-1 (entlast))
		(command "_RECTANGLE" '(-170 0) '(-110 -15))
		(setq rctn-2 (entlast))
		(command "_RECTANGLE" '(-110 0) '(-45 -15))
		(setq rctn-3 (entlast))
		(command "_RECTANGLE" '(-45 0) '(-35 -15))
		(setq rctn-4 (entlast))
		(command "_RECTANGLE" '(-35 0) '(-20 -15))
		(setq rctn-5 (entlast))
		(command "_RECTANGLE" '(-20 0) '(0 -15))
		(setq rctn-6 (entlast))

		(setvar "CELWEIGHT" -1)
		(setvar "TEXTSTYLE" "Standard")
		(command "_TEXT" "_MC" '(-177.5 -7.5) 2.5 0 "Поз.")
		(setq txt-1 (entlast))
		(command "_TEXT" "_MC" '(-140 -7.5) 2.5 0 "Обозначение")
		(setq txt-2 (entlast))
		(command "_TEXT" "_MC" '(-77.5 -7.5) 2.5 0 "Наименование")
		(setq txt-3 (entlast))
		(command "_TEXT" "_MC" '(-40 -7.5) 2.5 0 "Кол.")
		(setq txt-4 (entlast))
		(command "_MTEXT" '(-35 0) "_H" 2.5 "_j" "_mc" '(-20 -15) "Масса, ед., кг." "")
		(setq txt-5 (entlast))
		(command "_MTEXT" '(-20 0) "_H" 2.5 "_j" "_mc" '(0 -15) "Приме- чание" "")
		(setq txt-6 (entlast))
		(command "_block" "чро-шапка-спцф"	'(0 0) rctn-1 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6
			txt-1 txt-2 txt-3 txt-4 txt-5 txt-6 "")
);progn
);if

(setvar "OSMODE" 6199)

(setq pnt-1 (getpoint "\nУкажите точку вставки\n"));setq

(command "_insert" "чро-шапка-спцф" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-1) ;если блок существует

(setvar "CMDECHO" 1)
(setvar "ORTHOMODE" 1)
(setvar "OSMODE" 6199)

(vla-endundomark adoc)

(princ )
)
;/////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////
