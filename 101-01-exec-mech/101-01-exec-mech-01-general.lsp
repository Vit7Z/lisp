;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-01-exec-mech-01-general

( / adoc dcl-id list-01 type-list-01)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq list-01 (list "МЭО-40" "ПЭМ-А" "ПЭМ-Б")
			list-02 (list "PSQ"));setq

(if (< (setq dcl-id (load_dialog "dia-101-01-exec-mech-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_el_exec_mech_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)

(action_tile "txt-01"
  (strcat "(setq type-list-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq type-list-02 (nth (atoi (get_tile \"txt-02\")) list-02))"
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
	((= type-list-01 "МЭО-40") (load "d:\\yandexdisk\\my-sprt\\101-01-exec-mech\\101-01-exec-mech-abs-z-meo-40-01-general.lsp") (101-01-exec-mech-abs-z-meo-40-01-general));=
	((= type-list-01 "ПЭМ-А") (load "d:\\yandexdisk\\my-sprt\\101-01-exec-mech\\101-01-exec-mech-abs-z-pem-a-01-general.lsp") (101-01-exec-mech-abs-z-pem-a-01-general));=
	((= type-list-01 "ПЭМ-Б") (load "d:\\yandexdisk\\my-sprt\\101-01-exec-mech\\101-01-exec-mech-abs-z-pem-b-01-general.lsp") (101-01-exec-mech-abs-z-pem-b-01-general));=
);cond

(cond
	((= type-list-02 "PSQ") (load "d:\\yandexdisk\\my-sprt\\101-01-exec-mech\\101-01-exec-mech-ps-auto-psq-01-general.lsp") (101-01-exec-mech-ps-auto-psq-01-general));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////