;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование осевой линии                                       //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:699-axial-line

( / adoc angl angl-1 pnt-1 pnt-2 pnt-3 pnt-4 tmp-celtscale tmp-celtype)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))) ; start undo

(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(if (= (tblsearch "ltype" "acad_iso04w100" t) nil)
  (command "_.linetype" "_l" "acad_iso04w100" "acadiso.lin" "")
);if

(setvar "celtype" "acad_iso04w100");новый тип линии
(setvar "celtscale" 0.4);новое значение масштаба

;исходные данные
(setq	pnt-1			(getpoint "\n”кажите 1 точку\n")
	    pnt-2			(getpoint "\n”кажите 2 точку\n")
  		angl-1 (+ (angle pnt-1 pnt-2) 3.14159)
  		angl (angle pnt-1 pnt-2)
);setq

(setq	pnt-3			(polar pnt-1 angl-1 3)
	    pnt-4			(polar pnt-2 angl 3)
);setq

(setvar "osmode" 0)

(command "_line" pnt-3 pnt-4 "")

(setvar "celtscale" 1);возвращаем настройки
(setvar "celtype" "bylayer")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////
