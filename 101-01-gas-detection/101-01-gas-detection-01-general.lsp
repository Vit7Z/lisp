;;; ////////////////////////////////////////////////////////////////////////
(defun c:101-01-gas-detection-01-general

( / adoc dcl-id list-01 list-02 sel-01 sel-02)

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);undo

(setq list-01 (list "ИГС-98 Клевер-СВ (исп. 011)"
										));setq
										
(setq list-02 (list "ИГС-98 Верба-Д (исп. 009)"
										));setq

(if (< (setq dcl-id (load_dialog "dia-101-01-gas-detection-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_01_gas_detection" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)

(list-filling "txt-02" list-02)

(action_tile "txt-01"
  (strcat "(setq sel-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq sel-02 (nth (atoi (get_tile \"txt-02\")) list-02))"
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
	((= sel-01 "ИГС-98 Клевер-СВ (исп. 011)") (load "d:\\yandexdisk\\my-sprt\\101-01-gas-detection\\101-01-gas-detection-oxygen-igs-98-ver-011.lsp") (101-01-gas-detection-oxygen-igs-98-ver-011));=
);cond


(cond
	((= sel-02 "ИГС-98 Верба-Д (исп. 009)") (load "d:\\yandexdisk\\my-sprt\\101-01-gas-detection\\101-01-gas-detection-hydrogen-igs-98-ver-009.lsp") (101-01-gas-detection-hydrogen-igs-98-ver-009));=
);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////
