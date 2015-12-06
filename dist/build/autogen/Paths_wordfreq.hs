module Paths_wordfreq (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/hawk/.cabal/bin"
libdir     = "/Users/hawk/.cabal/lib/x86_64-osx-ghc-7.10.2/wordfreq-0.1.0.0-6MMVYxK1KsPL73vBMZZ2z6"
datadir    = "/Users/hawk/.cabal/share/x86_64-osx-ghc-7.10.2/wordfreq-0.1.0.0"
libexecdir = "/Users/hawk/.cabal/libexec"
sysconfdir = "/Users/hawk/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "wordfreq_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "wordfreq_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "wordfreq_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "wordfreq_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "wordfreq_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
