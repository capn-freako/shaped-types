-- {-# LANGUAGE #-}
{-# OPTIONS_GHC -Wall #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-} -- TEMP
-- {-# OPTIONS_GHC -fno-warn-unused-binds   #-} -- TEMP

----------------------------------------------------------------------
-- |
-- Module      :  ShapedTypes.Interactive
-- Copyright   :  (c) 2016 Conal Elliott
-- License     :  BSD3
--
-- Maintainer  :  conal@conal.net
-- Stability   :  experimental
-- 
-- Interactive HERMIT-based plugin
----------------------------------------------------------------------

module ShapedTypes.Interactive (plugin) where

import GhcPlugins (Plugin)
import HERMIT.Plugin (hermitPlugin,lastPass,interactive)

import Monomorph.Plugin (tweakPretty)
import qualified Monomorph.Stuff        as St
import qualified LambdaCCC.Reify        as Re
import qualified LambdaCCC.Monomorphize as Mo

plugin :: Plugin
plugin = hermitPlugin ( lastPass
                      . (tweakPretty >>)
                      . interactive (Re.externals ++ Mo.externals ++ St.externals) )
