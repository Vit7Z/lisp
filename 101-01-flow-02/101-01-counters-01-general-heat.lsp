;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// приборы для измерения давления                               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-01-heat-meter-general

( / adoc dcl-id type-list)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (< (setq dcl-id (load_dialog "dia-101-heat-meter-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_heat_meter_general" dcl-id))
		(exit)
);if

(action_tile "but1"
  (strcat "(setq type-list \"but1\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"but2\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"but3\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond
	((= type-list "but1") (load "d:\\mcloud\\my-sprt\\101-01-heat-meter\\101-01-heat-meter-logika.lsp") (101-01-heat-meter-logika));if
	((= type-list "but2") (load "E:\\my-sprt\\101-01-heat-meter\\101-tekon20k.lsp") (101-tekon20k));if
	((= type-list "but2") (load "E:\\my-sprt\\101-01-heat-meter\\101-std-dinfo.lsp") (101-std-dinfo));if
);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////