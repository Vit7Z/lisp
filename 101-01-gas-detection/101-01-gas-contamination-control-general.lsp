;;; ///////////////////////////////////////////////// оформление перечня элементов ///////////////////////
(defun c:101-01-gas-contamination-control-general

( / adoc dcl-id list-01 type-list-01)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "Газ ФАРМЭК"
										"Seitron")
);setq




(if (< (setq dcl-id (load_dialog "dia-101-01-gas-contamination-control-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_01_gas_contamination_control_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)

(action_tile "txt-01"
  (strcat "(setq type-list-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
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
	((= type-list-01 "Газ ФАРМЭК") (load "d:\\mcloud\\my-sprt\\101-01-gs-cntr\\101-01-gas-contamination-control-frmk.lsp") (101-01-gas-contamination-control-frmk));=
	((= type-list-01 "Seitron") (load "d:\\mcloud\\my-sprt\\101-01-gs-cntr\\101-01-gas-contamination-control-seitron.lsp") (101-01-gas-contamination-control-seitron));=
);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////
