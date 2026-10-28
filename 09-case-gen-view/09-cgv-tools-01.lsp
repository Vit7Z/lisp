;;; ///////////////////////////////////////////////// оформление перечня элементов ///////////////////////
(defun c:09-cgv-tools-01

( / adoc dcl-id type-list)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (< (setq dcl-id (load_dialog "dia-09-cgv-tools-01.dcl")) 0) ;ищем диалог
  (progn
	  (alert "Не найден dcl-файл")
		  (exit)
  );progn
);if

(if (not (new_dialog "dia_09_cgv_general" dcl-id))
		(exit)
);if

(action_tile "but12"
  (strcat "(setq type-list \"but12\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but13"
  (strcat "(setq type-list \"but13\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but14"
  (strcat "(setq type-list \"but14\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but19"
  (strcat "(setq type-list \"but19\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but21"
  (strcat "(setq type-list \"but21\")"
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
	((= type-list "but12") (load "d:\\yandexdisk\\my-sprt\\09-case-gen-view\\09-cgv-tbl-inscript-cap.lsp") (09-cgv-tbl-inscript-cap));if
	((= type-list "but13") (load "d:\\yandexdisk\\my-sprt\\09-case-gen-view\\09-cgv-tbl-inscript-empt-line.lsp") (09-cgv-tbl-inscript-empt-line));if
	((= type-list "but14") (load "d:\\yandexdisk\\my-sprt\\09-case-gen-view\\09-cgv-inscription-number.lsp") (09-cgv-inscription-number));if
	((= type-list "but19") (load "d:\\yandexdisk\\my-sprt\\09-case-gen-view\\09-cgv-cbl-channel.lsp") (09-cgv-cbl-channel));if
	((= type-list "but21") (load "d:\\yandexdisk\\my-sprt\\09-case-gen-view\\09-cgv-legend-surface.lsp") (09-cgv-legend-surface));if
);cond
(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////