-- catty.hs
module Catty where

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y


flippy :: String -> String -> String
flippy = flip cattyConny


appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"


-- #1
-- appedCatty "woohoo!"
-- output:  "woops mrow woohoo!"

-- #2
-- frappe "1"
-- output: "1 mrow haha"

-- #3
-- frappe (appedCatty "2")
-- output: "woops mrow 2 mrow haha"

-- #4
-- appedCatty (frappe "blue")
-- output: "woops mrow blue mrow haha"

-- #5
-- cattyConny (frappe "pink")
--            (cattyConny "green"
--              (appedCatty "blue"))
-- output: "pink mrow haha mrow green mrow woops mrow blue"

-- #6
-- cattyConny (flippy "Pugs" "are") "awesome"
-- output: "are mrow Pugs mrow awesome"
