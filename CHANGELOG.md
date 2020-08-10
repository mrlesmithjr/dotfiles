commit aa1dcfcc763e41b53b6c56afff84765f00bad8ad
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Aug 10 01:49:48 2020 -0400

    removed submodules

commit f07d5dd5ea2c9afbd780d851d1b6256c45fc620d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Aug 7 23:00:48 2020 -0400

    Latest Updates for vim, zsh and iterm

commit e5219f0dacd15bdde03a92588afe8158c652782e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Aug 7 22:52:41 2020 -0400

    Updated vim submodules

commit 095f70a712fd7ccdf9a215d04f6b625652f43f82
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Aug 4 17:06:29 2020 -0400

    Updated Python requirements

commit 5ab0c86cd3cfd554da859a7a0fa237de381a50c9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 22 00:08:08 2020 -0400

    Updated with latest iTerm settings

commit b7007bdf755fc33b5dd71a6573f80ba9ead35587
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 22 00:07:14 2020 -0400

    Latest VSCode extensions

commit e3e7c8766f60aca04d8b7facb77c292d2f6e4ed7
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 22 00:06:56 2020 -0400

    Updated Python requirements

commit 3567b9ea830db34b41d5870dc92457623e5cdea7
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 22 00:06:33 2020 -0400

    Removed Git pre-commit
    
    This was added to warn when attempting to commit to master/develop
    
    Not using this anymore

commit 2f64df8f78b1493510f635d8add68b436a8a232e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon May 25 00:52:15 2020 -0400

    Adding ZSH and Oh-My-Zsh
    
    Because we can use dotfiles without devops-workstation-setup, we need to
    install ZSH and Oh-My-Zsh here. This ensures that we have a functional
    Zsh environment without any additional setup from our other project.

commit 160e429577f5321bb6a1b567a8ce65b82d225551
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon May 25 00:50:15 2020 -0400

    Added initial WSL checks for VSCode extensions
    
    Not able to capture VSCode extensions installed when within a WSL
    environment.

commit 4ee6728af5ad7b18f6a194c18961dc1d49c1c5e2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat May 23 09:50:08 2020 -0400

    Updating git hooks to latest
    
    - Updated format of existing post-commit hook
    - Added pre-commit hook to ensure we are notified when trying to commit
      to master or develop branches

commit 70f4ee5549e0577ed23ecdf84077a3b5c25375a4
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue May 19 21:28:26 2020 -0400

    Fixed path to Python requirements for pip-sync

commit 48ad30ec4d44d99b7611f9cdd5a83cb4a704e7be
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue May 19 11:43:05 2020 -0400

    Fixed issues with kubectl and go validations

commit e012bf09c6ae1d25cfd21076187ffff51eab6a21
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue May 19 00:50:26 2020 -0400

    Updated submodules

commit 342805f5255279627a75c7ae0247c162a4908d22
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue May 19 00:49:22 2020 -0400

    Updated Python requirements

commit 33c2c41d686f12d4a846f44afa70cafbd9821569
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue May 19 00:49:03 2020 -0400

    Updated with K8s tools

commit aa795f5dce14dd3ad7bfcac628f91963cb9e18cf
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu May 14 20:38:16 2020 -0400

    Switching to pip-tools for managing Python reqs

commit 4d4fe45a60aa18c93c89aa40ec4a4bddb245a999
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 25 11:46:57 2020 -0400

    Fixing Ubuntu version check

commit 0babfc922cee40407950e7f659d9773947e43bea
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 25 11:44:44 2020 -0400

    Initial testing of Ubuntu 20.04

commit 2c6c8a01650505d5827aca48c4880748443a13ed
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Apr 19 15:49:32 2020 -0400

    Fixing Homebrew perms alias, etc.

commit cb09949e59686e830ea029ad5c560b561c541cc8
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 18 18:12:33 2020 -0400

    Added missing chown for Homebrew perms

commit 554e37e82312a4015bb6a379715a6d23d6730be3
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Apr 13 18:55:47 2020 -0400

    Fixed Homebrew permission issues for multi-user
    
    Because of the lack of multi-user support for Homebrew. These changes
    will assist in resolving these issues. Will need much more testing. But
    looks promising thus far.

commit feeb74c7b8598911b04316a78c6d84ab1e5aea75
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Apr 12 11:26:38 2020 -0400

    Fixed path export for dotfiles

commit 0554c3410bddb84bc4d141550f2c803a01d35a04
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Apr 7 01:29:57 2020 -0400

    Latest updates, etc.

commit c44596595f37bdc7af7134e8e18c2c992e9a2cac
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 15 19:00:14 2020 -0400

    Latest updates for macOS, etc.

commit c255ffbeabd994b53dcdab2af0b0f4b5ce75d8cc
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 13:27:04 2020 -0400

    Testing GitHub actions
    
    - Also added build status badges

commit 887156b5e7f29993bd32831c018773bc5c614763
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 13:12:40 2020 -0400

    Disabled OSX test
    
    - Cannot get it to work

commit e571b4b7000cffcc67ed62e8824ec4e727c492f0
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 13:08:01 2020 -0400

    Pinning OSX build version
    
    - OSX is failing

commit acb2394d088ca4d7b986d2f948559a3aea2e29ee
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 12:58:35 2020 -0400

    Still trying to get Travis working correctly

commit 3f7c08558f757537825c7409b23ed98d7df4056a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 12:26:00 2020 -0400

    Fixing: travis testing

commit 7fa5c98e019755e04332d9dedb568a628f4c6e71
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 12:18:34 2020 -0400

    Updated: changelog

commit 46606c0c47bc9b3fa794c797f936c4e958feaa1e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 12:11:09 2020 -0400

    First Travis CI testing

commit 288a04711814ff5644a16d71abdcd02c181e20f9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 12:01:34 2020 -0400

    Deleted lingering Brewfile
    
    No longer needed

commit e4985cb9767a7198628ec9044b31c4a2ca7d53a2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 11:59:24 2020 -0400

    Deleted old Atom configs

commit 33c5d329b4f3200b4808904e14b90308c965ae9f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 02:30:40 2020 -0400

    Added set -x to troubleshoot

commit 018274770f3a4e516dd9151bd42891644ffb742b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 02:01:00 2020 -0400

    Made setup.sh executable

commit 75de748fd697725953369a86c5140785e37fb839
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 01:59:49 2020 -0400

    Updated: repo info, etc.

commit 9309b4bc2e25b517b0444a4b69954f627a6e27a2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 00:30:28 2020 -0400

    Updated: Submodules

commit 4291e373c4c9158b094ba923332cad9fcb13fd04
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 9 00:12:05 2020 -0400

    Fixed: Shellcheck linting issues

commit 43960c48e77e28cfb3f4bdb2cd2ba98bfed35e2f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 8 18:02:24 2020 -0400

    Added: Check for ~/.netrc
    
    If not found, create it
    
    Ensure not in dotfiles setup for keeping in version control

commit b649229886934a6dbbad04536a3da6dbbfb6d229
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 8 14:35:11 2020 -0400

    Enhancement: Cleaning up old Python2
    
    Getting rid of old Python2 crap!

commit 75611e1d2862c9f0ef7c371a07e762242187eecc
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 8 11:15:54 2020 -0400

    Enhancement: ZSH_DISABLE_COMPFIX="true" and Shellcheck validations

commit dd16e4f9c7b477f44bdb5a9aa0c1f3c53fe1b4a7
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 8 11:15:10 2020 -0400

    Enhancement: shellcheck validations
    
    More are required

commit 47c809abf10af38d0ca92307d2528aa3a7c7ac76
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 8 10:55:14 2020 -0400

    Enhancement: Fine tuning Python3 requirements,etc.
    
    - There are some lingering issues from Python2 being depracated.
    Beginning to clean this up. There will be many more changes required
    coming.

commit cacbee4b41fda30730b7e8b911309680cf835bd0
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 6 20:55:13 2020 -0500

    Fixed: Python2 issues
    
    Python2 remnants causing issues when not available
    
    Disabling Python2 until I can clean it all up

commit db3c3cc4c38fcad0040e0f0faaf47c97f99bdacb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Feb 27 01:00:40 2020 -0500

    First commit of CHANGELOG

commit d5a0b2a3ff8d6808865eda0cfae37dd7313958af
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Feb 27 01:00:26 2020 -0500

    Updated Python requirements

commit 44970edfc0169a7abe624a19af72fdd6804015a3
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Feb 27 00:59:50 2020 -0500

    Updated VSCode extensions installed

commit a5b0e80a3b74fbb9ea1868ac430015113d41ccb1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Feb 27 00:55:59 2020 -0500

    Added first commit of git templates
    
    - Added post-commit hook to automatically generate CHANGELOG.md

commit ef6c3fb7f7d13b7aa8ea6bbe820e8430781e46a9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jan 13 00:43:55 2020 -0500

    Fixed issue with check for VSCode
    
    - The previous method was triggering the backup of extensions whether or
      not VSCode was found or not.

commit 3c9768cebcd1e43d89824919679cac508e10102c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Jan 11 15:52:45 2020 -0500

    Added check for code to prevent errors
    
    - Because we are capturing VSCode plugins, we need to ensure that code
      is found to prevent errors

commit d0834bac52e32266003b46b24a5df276b22f50a7
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jan 9 14:46:55 2020 -0500

    Updated all of the latest changes
    
    - bashrc
    - zshrc
    - VSCode Extensions
    
    - These updates are all that I have found since reloading macOS.

commit 01f8ff7302562f7b833da3a55a2c473d031a2feb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jan 8 11:32:43 2020 -0500

    Latest updates to iTerm preferences

commit 331a70e9209c309fb04c68feca8f5226e05d6853
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Jan 7 23:54:46 2020 -0500

    Latest updates after reloading macOS Catalina
    
    - Ran into a few snags, etc. when doing a fresh install. These include
      the latest changes.

commit fe42d24dadb805dcceb4c36292c42cbc34aaf2e5
Author: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
Date:   Wed Dec 4 01:49:11 2019 +0000

    Bump pyyaml from 3.13 to 5.1
    
    Bumps [pyyaml](https://github.com/yaml/pyyaml) from 3.13 to 5.1.
    - [Release notes](https://github.com/yaml/pyyaml/releases)
    - [Changelog](https://github.com/yaml/pyyaml/blob/master/CHANGES)
    - [Commits](https://github.com/yaml/pyyaml/compare/3.13...5.1)
    
    Signed-off-by: dependabot[bot] <support@github.com>

commit a767a80fa91d981ee05a6c06fc85cee34061ffd8
Author: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
Date:   Wed Dec 4 01:49:06 2019 +0000

    Bump ansible from 2.8.0 to 2.8.2
    
    Bumps [ansible](https://github.com/ansible/community) from 2.8.0 to 2.8.2.
    - [Release notes](https://github.com/ansible/community/releases)
    - [Commits](https://github.com/ansible/community/commits)
    
    Signed-off-by: dependabot[bot] <support@github.com>

commit 00150e1be5b005f5e2908a8c781fb639a1cf06cf
Author: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
Date:   Mon Dec 2 19:43:35 2019 +0000

    Bump typed-ast from 1.3.1 to 1.3.2
    
    Bumps [typed-ast](https://github.com/python/typed_ast) from 1.3.1 to 1.3.2.
    - [Release notes](https://github.com/python/typed_ast/releases)
    - [Changelog](https://github.com/python/typed_ast/blob/master/release_process.md)
    - [Commits](https://github.com/python/typed_ast/compare/1.3.1...1.3.2)
    
    Signed-off-by: dependabot[bot] <support@github.com>

commit 4f19e359f13783089b7acb3fbc966019ff1756e9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Dec 2 10:40:15 2019 -0500

    Changed git url changes
    
    - Although a nice change to implement to force all https remote urls to
    use ssh, this causes some issues.

commit b2cf05aba92d0dba6be1231000576b07896d30fc
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Nov 17 20:56:57 2019 -0500

    Updated Vim bundle

commit c93eb07c4572ba6db22f00860d09fecdd30bfdd8
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Nov 9 23:26:01 2019 -0500

    Changed default ZSH theme from agnoster to avit

commit 0b000cbb84177f02e5a04bb200f2581e2db8f23e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Nov 3 18:45:44 2019 -0800

    Changes ZSH theme
    
    - Started having issues with blocks, etc.

commit af566e57268df3d67776361fcde099c6a2e93aeb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Oct 27 21:49:52 2019 -0400

    Updated VSCode extensions list

commit b01b8a3d8e0515b98449ca8d157e82dbf54f5c05
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Oct 23 14:31:06 2019 -0400

    Updated VSCode settings

commit 96194258f43db525c9d1047eef43635c6e937c21
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Oct 23 14:30:12 2019 -0400

    Tweaked macOS update alias
    
    - The previous way this was done was not optimal

commit 7165c515c5d232c82f5063ab79bee230e24f43bc
Author: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
Date:   Mon Oct 21 17:49:25 2019 +0000

    Bump werkzeug from 0.15.2 to 0.15.3
    
    Bumps [werkzeug](https://github.com/pallets/werkzeug) from 0.15.2 to 0.15.3.
    - [Release notes](https://github.com/pallets/werkzeug/releases)
    - [Changelog](https://github.com/pallets/werkzeug/blob/master/CHANGES.rst)
    - [Commits](https://github.com/pallets/werkzeug/compare/0.15.2...0.15.3)
    
    Signed-off-by: dependabot[bot] <support@github.com>

commit 95c88fd9ccba9a7258419e4090a896ef978f273d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Oct 3 21:02:34 2019 -0400

    Updated to resolve macOS Homebrew Python  & Travis
    
    - If Homebrew were uninstalled, we need a way to reinstall Python
    without having to run setup script again.
    - Travis integration needed to be applied to properly work if Travis is
    installed.

commit 3d312cca425852914de7ddc1a3b4a37ea5fc0494
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Oct 3 20:57:49 2019 -0400

    Cleaned up Homebrew packages
    
    - Some packages were no longer used
    - Some packages are new

commit 63f0609710bee284cfa9a09351b5a01806cc38cb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Oct 2 19:00:59 2019 -0400

    Original Homebrew packages
    
    - This was a dump of packages to track for usage

commit d773d5e184b728fea055f6d669f96132ce244edb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 12 14:25:14 2019 -0400

    Updated VSCode settings

commit ec4cd2de4700bbcc2c18e5995bb237e328a74dd3
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Aug 8 16:25:06 2019 -0400

    Changed iTerm2 Profile Settings

commit af3aae4e6930eff4117a3b5555153037fbe8ab4b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Aug 8 16:25:06 2019 -0400

    Changed iTerm2 Profile Settings

commit 811aa1f5e1da6c2cfb3104cc82239d574359e531
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 24 22:29:38 2019 -0400

    Removed git commit message template
    
    This was more of a pain to leverage in my workflow than it was worth.

commit 9ad894e01250c8d1f0fbf35e7eda969bbf841d92
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 24 13:40:47 2019 -0400

    Updated VSCode extensions
    
    - Updates latest used VSCode extensions

commit ea072a37e8be5ecc0301d28968d9e3f3beb74c4d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jul 22 14:46:22 2019 -0400

    Added editor/telemetry VSCode settings

commit 28aa6622a71b417f96e52adac8d7b105f72bc553
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jul 14 00:58:29 2019 -0400

    Added add'l git global configs and git commit message template
    
    - Git configuration enhancements
    -
    -

commit 0433a55a63d91f72cd649fcb967628db6beb3a97
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Jul 13 23:27:18 2019 -0400

    Set default pull to rebase and enabled autostash for rebase

commit 006842ef7af05add085bf559d4a9b62423d1d5d6
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Jul 12 16:55:12 2019 -0700

    Removed missing extension
    
    peterjausovec.vscode-docker extension is no longer available.

commit d4943ef2c08e332309da0f6e8f361c02ea6ff946
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jun 12 11:07:08 2019 -0400

    Updated ZSH theme and iTerm settings

commit ba1fe178cf533b4d38debb95277bfdef975d6a23
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed May 29 08:09:36 2019 -0400

    Changed new tab settings
    
    Set the default to always reuse the same directory as current tab when
    opening a new tab.

commit 6c8e5eea7edae762fdebeb1938b4e707543a5a73
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed May 29 08:06:46 2019 -0400

    Added --no-ff for merges into master
    
    To ensure a good history is kept for master branches of any repo,
    --no-ff has been enabled as the default merge strategy for master.

commit 4ace7e6dc5c531a9cdaa8c6637cfa74fc9c1fda2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed May 29 00:49:54 2019 -0400

    Added prune as default for fetch

commit e81e524cef97bb1a9beebbc2900af3c8ba692f69
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed May 29 00:04:58 2019 -0400

    Updated repo info and added TOC

commit e4f68308d686db47a80ddae2ed61da5c3623637b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue May 28 23:54:31 2019 -0400

    Added rewrite urls to use SSH for GitLab/GitHub

commit f48ec7110ab27bd8992b55979d7ffa69201b484e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri May 24 00:56:21 2019 -0400

    Updated Python requirements

commit d2463c1017ab58b00e20466a8199fa3b7c303cd0
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri May 24 00:50:20 2019 -0400

    Updated VSCode extensions

commit bfaf799a14aac1fe58f83a862a57d3c4531e6839
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon May 20 21:28:33 2019 -0400

    Latest Hyper settings updated

commit 117e50eab2c999ffae3e6e0f4482488d5454d4c5
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon May 20 11:59:29 2019 -0700

    Tweaked Git global config
    
    Disabled git branch pager
    Enabled auto color for ui

commit 67b7ccba800d7aba1ca8934f68c580936dace649
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri May 17 13:46:28 2019 -0400

    Moved Linux Homebrew folder creation to setup.sh

commit 681f065c50eeb8142b14e2aa7108eb1c7cca00e1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu May 16 22:17:24 2019 -0700

    Initial commit of Linuxbrew (Homebrew)
    
    Adding this for Linux support of Homebrew. Homebrew is not as fully
    functional as Homebrew on macOS but will still be useful. A previous
    attempt at this was not so useful, but seems to be much better now.

commit 6b07e5c517a9455ed0258d6a2cfdc3d7d2c66bdd
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu May 16 15:14:57 2019 -0400

    Updated Hyper terminal plugins

commit e47807985c5583f246442345644cdb9ccc124608
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu May 16 01:05:03 2019 -0400

    Added Hyper terminal

commit c3ac726672df627d84638bb5be49b0ac394bf4ab
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu May 9 23:59:09 2019 -0400

    Latest updates and etc.

commit 887bffb3f5d5777e96faa3b6c6597b8faa5693eb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 27 09:31:32 2019 -0400

    Updated submodules

commit 3064370d567bb893da297d50b9379d3086864f1c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Apr 23 00:25:37 2019 -0400

    Added check for redhat when setting up python venv

commit ffcbc6b39e0f944efd48addae9e6f6697c430934
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 20 00:51:02 2019 -0400

    Added export for managing Windows via Ansible
    
    Issue with Python on macOS using Windows Ansible modules.

commit f89ad29ec45074a78996d41f2cc3b0f6e9717e7a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Apr 16 09:00:00 2019 -0400

    Updated Python requirements based on switching to Python3

commit e1618effac69ab820d4bd546814203d50ebcf592
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Apr 15 23:11:45 2019 -0400

    Updated submodules

commit 4dce3c76e9ee08e8a318667019398dcf3decb01f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Apr 12 18:56:18 2019 -0400

    Changed everything to default to Python3. Will need to figure out Ubuntu python-apt issue.

commit 0bf51ace4b396d543a376a46522742c3d9fc3ebe
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Apr 12 18:54:00 2019 -0400

    Removed missing extension

commit 70c5730f0410849416b78904eb538e0f7551d9ca
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Apr 11 22:54:59 2019 -0400

    Changed default Python version to 3

commit 0cc786d6b452b8f496b58a36769d18a7c64dcf6d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Apr 11 07:51:03 2019 -0400

    Updated to latest VSCode settings

commit 5fcb67dfce0b7ff20e3f0fa6a5633efd6c98ef45
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Apr 11 07:50:46 2019 -0400

    Removed missing extension

commit 28abc772632847342499781513f12ad8b3f4cd1f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Apr 3 16:26:02 2019 -0400

    Removed plugin zsh-syntax-highlighting

commit e1b32535ea6d98122e45a2b034adc642fccae342
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Apr 3 08:58:56 2019 -0400

    Updated VSCode settings

commit 6857e099fe6d7d84839f4c17a8c99f796e23b84b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Feb 20 00:33:09 2019 -0500

    Added Tmux and prompt for sudo password when running Ansible playbook

commit beea65604fafa07ca89a9d0439cc41464dbe8013
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jan 10 22:45:17 2019 -0500

    Updated VS Code extensions

commit 61dc265c2a5b4041d12754bde5ddcc99660cbb30
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jan 10 18:48:59 2019 -0500

    Added python module updates

commit 15ee1edc804bf1acfb712718163c12b5d8a37c6e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jan 10 00:38:32 2019 -0500

    Resolved vulnerability in pyyaml

commit 58c34beb2dea30f02b3113fd86aac9077f2bc03b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 26 23:42:48 2018 -0500

    Updated VSCode settings

commit 2fd5ed14a9d98736033485bd3e9f7057e566a0a1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Dec 23 01:06:31 2018 -0500

    Updated submodules

commit f6a2cd584ea513756f407f9e5d70e92bd0c96dd5
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Dec 18 01:35:38 2018 -0500

    Added submodule python-mode for vim back

commit 996bc94623d49ee043d56a57aae20f65d3edd70f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Dec 18 01:25:10 2018 -0500

    removed python-mode submodule
    
    Trying to fix

commit 502ab0ea1be3cc42fc2daf31a78e917249c8eb74
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Dec 18 00:30:17 2018 -0500

    Updated submodules

commit db2d7bfe8749bd831c238fc38b700f3f59737988
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 12 22:59:22 2018 -0500

    Finally resolved issue with virtualenvs and cd|ls

commit c9b054a15b4e44dd699188710611550edaa9e905
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 12 20:37:05 2018 -0500

    Changed python-virtualenvs to a hidden folder in home

commit 1fd3de2ffcccb08b05b533be0970278e05871101
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 12 08:57:07 2018 -0500

    Disabled ls function to isolate any issues
    
    Now a functional cd function to ensure that we are always in the correct
    default virtualenv based on different scenarios.

commit 44fe4855b9d572725906b217f061b37e38dc5a94
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 12 00:21:33 2018 -0500

    Variablized Python2 and Python3 paths

commit a196aa725d03d4985953b36c41482154f36f1f11
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Dec 11 21:29:46 2018 -0500

    Deactivate causes issues when replacing default symlink

commit b90d55280fb0257ac6c283dbb641ddf14a7a104f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Dec 11 20:11:14 2018 -0500

    Fixed issue with versions being defined completely

commit 319cea461f1d725ec63a5e80b07bf4a44e5071f3
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Dec 11 19:46:57 2018 -0500

    Added default Python2 & Python3 virtualenvs
    
    The default virtualenv is now a symlink to the defined default Python
    version desired. Currently, 2.7.15 or 3.7.1 can be chosen. The default
    is 2.7.15, but using a symlink makes it easy to change.

commit d9d632af16d5550e168726305833a973b1001e01
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Dec 10 23:39:25 2018 -0500

    Allow y|yes for activating default virtualenv

commit 321a9f8e779c3c3b13e6a94efd772a46aee80c96
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Dec 10 22:46:08 2018 -0500

    Cleaned up per shellcheck

commit 91784e9e8fc2573f31ae032588db2ca6d1bc8db2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Dec 10 22:20:46 2018 -0500

    Unset disable_env on ls if virtualenv sourced after disabling

commit 516c9f0cd0259f29d51fb15a3258a55e3a58cc62
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Dec 10 22:14:09 2018 -0500

    Added ability to disable default virtualenv

commit c4687c5a6152f1ba1550c4aa71d350be784b8d2c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Dec 10 14:36:15 2018 -0500

    Updated VSCode settings/extensions

commit 9480085527764491827ec74487c3996c6de233cb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Dec 9 23:09:13 2018 -0500

    Fixed issue when not in virtualenv and venv exists. ls and cd now switch to venv

commit 33dcc4e83682d84a9d620b34a739e8ad08998b50
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Dec 9 22:54:30 2018 -0500

    Fixed issue when in Ansible virtualenv. No longer deactivates as these have priority

commit 215524eb5cfd97e7be7644710c9b1dbdce9f2d77
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Dec 9 16:30:16 2018 -0500

    Fixed Ruby gem installs

commit f8696900349c0380d7aa8d7d7caf72b5b6619c8d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Dec 8 12:38:17 2018 -0500

    Fixing CentOS install and cleaning up yaml

commit 6ac1c9b385cbe6a87ea7971d56eade1039175992
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Dec 8 00:29:32 2018 -0500

    Added function to enable default virtualenv on `ls` when not in a virtualenv

commit c0acbef3f6a0f99ad7c3adbdef92ebb7dec56708
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Dec 8 00:18:29 2018 -0500

    Fixed issue with Ansible virtual environments.
    
    Will remain in Ansible virtual environment until deactivated, and then
    once you cd again the default will activate.

commit 8141361d2340d6b3cfe0271a63dae2fa9af7411a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Dec 7 23:41:38 2018 -0500

    added variable for virtualenv path

commit 043db260427318230901ebdaf68e85706bbc2a5f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Dec 7 23:19:13 2018 -0500

    Updated VSCode extensions
    
    Removed bash beautify as it is deleting code, and is no longer
    maintained from what I can tell.

commit 9eab08d9fbf563aca6531c68d65738f9b5e47896
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Dec 7 20:10:17 2018 -0500

    Added literal localdir source

commit 6caf56501598fde8504514908ec82150044088d0
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Dec 7 16:31:16 2018 -0500

    Fixed issue where deactivating a virtualenv does not automatically open up defaul when cd

commit a78296cc5b7c3bfb0a8c915a0ec5489f051ec8a5
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Dec 7 12:53:04 2018 -0500

    Fixed issue changing to subdir w/virtualenv

commit 8b1bd0ef23d73f59dcbd3ac0c6e50c5a6bfdea6a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Dec 7 10:25:43 2018 -0500

    Making sure bashrc virtualenv setup matches zshrc

commit af8d03a0d305f1b5b629c050888a707ce500d5c1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Dec 7 10:17:53 2018 -0500

    Fixed issue with virtualenv deactivating in child subdir

commit 37cdefaeb9a211b01c41d4856ec8b584698556f4
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Dec 7 09:22:55 2018 -0500

    added Python virtualenv bits to match zshrc

commit d194011f21535f9872cd4bcda5d9a116d4a45e8c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Dec 7 09:14:10 2018 -0500

    Changed update alias for macOS and added cd function
    
    The cd function will look for a Python virtualenv in current dir named
    venv, and source it. This will ensure that we are always in our intended
    virtualenv. If a venv dir does not exist, then our default virtualenv
    will be sourced.

commit 8c1ddfc4dc053bace2bd9db378e060a4d5abfd45
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Dec 6 11:34:15 2018 -0500

    Added temp pip freeze to capture installed packages for troubleshooting

commit 8c31ff8cd7d3cac8a29a2a06ba5e8d2121e6758a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Dec 6 11:23:50 2018 -0500

    Switched default theme

commit 557270c09ab20bd1299d5fe353f04113d53c0cb1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Dec 6 00:31:25 2018 -0500

    Moved individual gitignore files into parent for ease.

commit 2bcb5297a1ddab06f3cca016d7cfe24638f04f4b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Dec 6 00:30:34 2018 -0500

    Reset Atom and added only a few plugins

commit 98206a07c06b01b5c2fbdd3b10619354354029d1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 22:10:55 2018 -0500

    Changed oh-my-zsh theme back to agnoster

commit 691ed761d8495fb58a409062c975c69c7ddedb80
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 18:15:38 2018 -0500

    Added list of default required Python libraries

commit fb5f58c212892ad3a373002951352d3523f38892
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 18:06:05 2018 -0500

    Updated submodule

commit 72286f292fac101df45337c2454033e2eddec4e2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 17:28:19 2018 -0500

    Updated VSCode extensions

commit 3cc5668726620397601d89fc9abe5bb2218d1017
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 17:26:38 2018 -0500

    cleaned up

commit 24680b16268488a6fecdab5fe43ac408e199eff2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 17:23:34 2018 -0500

    Fixing per Ubuntu testing

commit 48dce63684c8ce29f6cac2f7da173d4bc60034d8
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 17:06:16 2018 -0500

    Fixing default virtualenv for Linux

commit 826f96287032accd4d01ce74e12e1ff693651f7e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 16:57:16 2018 -0500

    Fixed issue with creating virtualenv on macOS

commit 4575651703a17b6d12dd121b862ae8bbdf2919c4
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 01:09:25 2018 -0500

    Added default Python virtual environment for testing

commit b890b4a5633dde691f12682d1a8874b7f3890182
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Dec 5 00:25:52 2018 -0500

    changed zsh theme and plugins. Also, disabled Travis

commit 1f8b880e442e6b9fe10b3a41a71385f7dda1b725
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Dec 1 20:59:49 2018 -0500

    Updated ZSH theme

commit c67623ec3557050eae2727e92564b5cc8e75a202
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Nov 17 01:29:07 2018 -0500

    Updated VS Code settings

commit 4cbae7fd8f6a91125190fa111c36d614ca4c4e0e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Nov 9 23:13:12 2018 -0500

    Updated submodules

commit 4a3ce224c9bcb90a65503772ec1c9b32d3bf3a9f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Nov 9 14:46:31 2018 -0500

    Updated to latest settings

commit 3b6a5a53eec9501e5f498a017d83081c9237073a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Nov 3 09:14:23 2018 -0400

    Updated to include latest settings which includes removing meld and etc.

commit 5d73dbcb951a7c320460959dba6b2643f09a69c2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Oct 24 17:19:45 2018 -0400

    Disabling automatic git fetch in background

commit 53efb0b3fef0c8394879aae5eaf180b0a481822a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Oct 24 15:18:45 2018 -0400

    Fixed VSCode pylint issues

commit 8462d87a875997e71c6b06774373d9ec9eace6d9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Oct 24 14:06:30 2018 -0400

    Fixed path to projects

commit 0200f2d56e025a3cd49b81104a83606f7b16bdff
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Oct 23 23:20:21 2018 -0400

    Updated to latest settings for Atom, VSCode, and Python

commit 0a8eb22fec26bf8193bdc7d01ec619c91944c432
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Oct 23 09:25:54 2018 -0400

    Still trying to get the home path correct

commit 22a89167bbe7058a3ad370455f5c4c1affb10d02
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Oct 23 09:23:32 2018 -0400

    Trying to fix home path

commit c672e09ae927f561fd15939052bea675deedb80b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Oct 23 09:20:29 2018 -0400

    Added home path for git clone

commit 848b0651d5e444548a3ec119bbef1a92695b218d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Oct 23 09:17:31 2018 -0400

    Trying to fix git clone path

commit e4512364884b5240c77bfae5600a5d3272740bd3
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Oct 23 09:13:29 2018 -0400

    Trying to fix Travis build directory

commit d28581da027cb58a5c03e7641c74557392aa97bf
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Oct 23 09:06:10 2018 -0400

    Setup script not running

commit 3571c68912095a5968955128fdac9b88db99f917
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Oct 23 09:02:03 2018 -0400

    Attempting to fix Travis testing for required Ruby missing

commit 05bf1ae71b58000dd1dc0059d859b99994569f10
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Oct 23 08:50:36 2018 -0400

    Added initial Travis testing

commit f97c61f69780a760b63d456cb6a99ec7b01e6b4c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Oct 19 17:19:27 2018 -0400

    Updated all submodules

commit 222dce9902b0f3358e7a6cbb639001546f59be73
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Oct 19 17:13:06 2018 -0400

    Updated VS Code settings to latest

commit e7adf513666c8983bcb080f041b6e7dd92d0bc59
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Oct 19 17:11:47 2018 -0400

    Added additional work related folder

commit c56ad91910b470f4d54dacb4864ac3858849fc7f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Sep 30 01:04:35 2018 -0400

    Updated VS Code extensions

commit c8a2783b464bf7ac4dd2d887dbb0b84ce88090ba
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Sep 19 18:17:23 2018 -0400

    Updated to latest submodules

commit 2b4c1216d196c57df7873e2954a461e4cfa4003d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Sep 14 01:00:48 2018 -0400

    Changed VSCode theme to Dracula

commit 62ff1bb9fefd9621d66297d09dd5516a27ea2938
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Sep 14 00:50:52 2018 -0400

    Cleaned up code formatting

commit dbdd270261862103ff1ee26e802902dbde25e8fd
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Sep 14 00:48:54 2018 -0400

    Updated VSCode settings

commit 318b62bd375efaef5b389336948d908234585762
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Sep 14 00:48:40 2018 -0400

    Updated VSCode extensions

commit dcc22d6eadad5466e0d904f3a9a1b767d89aa5b6
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Sep 11 01:13:31 2018 -0400

    Updated usage info for more clarity

commit 55e322439e76208b0f941f94e4289e4ebf9255e8
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Aug 25 13:46:56 2018 -0400

    Updated iTerm2 settings to enable ligatures

commit 0d54e7306f04363b432ecc06a617e0a6568f04b8
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Aug 25 13:02:18 2018 -0400

    Updated iTerm2 settings to disable ligatures
    
    Was causing some issues with Ansible shell commands for some reason.
    Will look into this again later.

commit 8c6665576d7732c02a7129cad6e7ab58e2ff3160
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Aug 25 01:25:41 2018 -0400

    Added fira-code as default font for iterm2, vs code, and atom

commit 4e126db571146552605971ccf81904b819dd79bc
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Aug 23 09:39:14 2018 -0400

    Updated VS Code extensions

commit ec26462220d5e0622876aca1400516c623764079
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Aug 23 09:08:22 2018 -0400

    Merged many different scripts into a single script and cleaned up

commit 653681cfcb0b12fe95d3319303f195b73fb998d7
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Aug 18 00:36:02 2018 -0400

    Updated VSCode settings

commit c1d41956183ac2b48739c54b40a1016c1716aaec
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Aug 13 18:56:43 2018 -0400

    Updated to latest packages and settings

commit 3896fa8ace3abdf4410de86eff1ee9c825a16ff4
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Aug 1 16:27:47 2018 -0400

    Updated gitignore as I was having issues trying to figure out why tests/roles were being ignore in Ansible roles

commit 155a3b8e59c6b80c78ad51827be9a2363a473a82
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jul 30 22:52:17 2018 -0400

    Added ability to set state of packages rather than commenting out.
    
    This functionality allows previously installed packages to be easily
    removed and vice versa.

commit 2170def6b177cc72d983a9c591600990793b7269
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 25 21:51:13 2018 -0400

    Updated to latest settings to keep

commit 7943eb5739fd5de264a072a28c6d9bf62c816f57
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 25 20:00:01 2018 -0400

    Cleaned up settings

commit d7e18dd56b19e403788ebec19f0ff010b1812738
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 25 19:37:16 2018 -0400

    Adding dconf settings for keeping Linux systems in sync

commit 5bdbcd2453043314d36e320fe51ddf506ee4bb13
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 25 18:10:18 2018 -0400

    Reverted back to previous ZSH Theme
    
    Didn't like not seeing the Python virtualenv information when in use.

commit 044e3e50544d6abb30b27c3bd96afb6b804f4ddf
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 25 13:00:30 2018 -0400

    Updated submodules

commit 5ca8979b8aff36599fc67d1a6ddfc895758ee821
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 25 12:51:08 2018 -0400

    disabled Molecule as it is causing issues

commit d691266c82553444a6040abbcd11ae7af58dde90
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jul 25 12:43:45 2018 -0400

    Fixed Linux Mint check and added Hashi Ansible role

commit d620bf98a83621db906bb5cd84e0c7ad53adebc5
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jul 19 22:25:02 2018 -0400

    Added additional ide packages

commit a4ab397081bf6238689038b70b09eff3e366f452
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jul 19 20:56:46 2018 -0400

    Latest updates of settings

commit 4cfbb8486b8ee129318858a0323437d427f2bb96
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jul 12 11:01:15 2018 -0400

    Updated Atom settings and packages

commit d1b12c911c13fe1740b18b4c70e937bc092ace1a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jul 9 00:29:34 2018 -0400

    Updated iterm settings

commit d987c4611e7705643fef110b736a8b8ba45e8867
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jul 9 00:29:12 2018 -0400

    Updated Atom packages and config

commit dc228a8c22e8ca902702e246a4a02bc5a9817829
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Jun 26 01:20:09 2018 -0400

    Added add'l logic to setting up symlinks
    
    Now we check to see if the dotfile exists, if it does, then we check if
    it is already set as the proper symlink to our dotfiles. If it is not
    properly set, we then backup (mv) the existing file or directory to
    .dotfiles_old, then we create the dotfile symlink as it should be.
    
    Using this new method keeps from filling up our .dotfiles_old directory
    with a bunch of backed up dotfiles which are nothing more than symlinks
    to our desired .dotfiles location. The previous method was not efficient
    and purely just did a backup (mv) no matter what and then recreated the
    symlink.

commit d11342bc382bdd6db33bc16a17bb616ee7a73c3e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 24 18:15:17 2018 -0400

    Added vim python-mode submodule back

commit 7ceca19932aff76f01e5bcdf1f5d31fc438102f8
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 24 18:13:04 2018 -0400

    Fixing python-mode vim submodule

commit b6c3fb8d051fba50dc69e0fcfbb5c5af8a0fe3c9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 24 17:18:47 2018 -0400

    Updated submodules

commit c64fd86e71fa455dfdb42ec95997b3697f141987
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 24 17:18:47 2018 -0400

    Updated submodules

commit ccd3e3d703f803110121e60e64b25ee2ad5ed50a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 24 17:12:22 2018 -0400

    Added info on VS Code extensions

commit 4b630bb1bca20f21732a153b09290fd167d9837b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 24 17:07:23 2018 -0400

    Added VS Code extensions exported and installed with Ansible during setup

commit fa41e1e42f58ff9faaabbb1d8a30b55524ae3954
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 24 16:37:50 2018 -0400

    Updated VSCode settings

commit 6aec06f85aa82c555e2a07651856ebcd30f8e1bf
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 24 15:24:54 2018 -0400

    Cleaned up formatting and updated info around usage.

commit 38d3e247ccd13ede117c1a193d422dcde4ff5835
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Jun 23 21:00:56 2018 -0400

    Disabled minimap and added editor ruler at character 80

commit adc4b03c86c87f3f90638910bd9acb4bbfb2e443
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jun 21 09:32:01 2018 -0400

    Updated to latest ZSH settings

commit 5df5b187f336dd614c3ea440536d09fdaa9c3736
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 17 00:54:33 2018 -0400

    Fixed export path from brew doctor recommendation.
    
    Will make sure no issues come up from a path perspective.

commit 4237a884abd779971c035e2f8070480355fa7cfc
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat May 5 15:01:00 2018 -0400

    Added status info for submodules
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 6a26c169943c00342a1e2607f60ffc78031d3ac1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat May 5 14:43:36 2018 -0400

    Changed to submodule

commit 2c7c3cf55fe242e0630bacf5f596f8be55158f68
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat May 5 14:42:30 2018 -0400

    Changed to submodule

commit 5e785ba6d24b4ad58766d4fa78883114729d5302
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat May 5 14:41:04 2018 -0400

    Changed to submodule

commit 70f3a7e50d326367071f87ca8bbbda54f03d5939
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Apr 26 20:40:45 2018 -0400

    Fixed issue with Ubuntu 18.04 Desktop
    
    Was getting a tput: No value for $TERM and no -T specified. This fix
    resolves that issue.

commit 40979df0a3503e8b667f6f1db4e760e8a548636f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Apr 6 20:22:24 2018 -0400

    Added Ubuntu credential helper info

commit 0253a9064a4fc975c79a2e0a94c007d09a565b89
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 4 00:53:35 2018 -0500

    Updated Atom config

commit 55693720d238af6c6eedf92f738caaf8495fa619
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 4 00:53:01 2018 -0500

    Added wordcount package for Atom

commit 37ca2928df830fc4698dc45250f779ed0fd3fb54
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jan 4 01:08:58 2018 -0500

    Updated bash/zsh config

commit 12824f21f380e947a82d3c7b22ef4b1d4f2a8868
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Oct 20 13:01:22 2017 -0400

    updated VSCode, Atom and zsh

commit 92a8413c7fdb6407fa9a170d71f5794c34778d7d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Oct 7 23:53:32 2017 -0400

    Updated ATOM config/packages

commit 1ab0b9c5f9019f570cca969ecb2eba5069db257b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Oct 4 15:59:50 2017 -0400

    Cleaned up Atom plugins
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 6313d025e065af0f0a3cd9f9547ce9b334edf161
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 28 09:01:57 2017 -0400

    Fixed vscode dotfiles setup when existing info exists

commit 7b70acd1f3bf57586b20f4928c2ac65a75e48854
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 28 01:00:31 2017 -0400

    Updated pylint path

commit 43566cacbf6e1474f590b8be6516cdbbfae81a43
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 28 00:51:06 2017 -0400

    Added Linux support for vscode dotfiles

commit 6fa817b8d9f8e22f1915f719fcda5ca070f5f7de
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 28 00:45:36 2017 -0400

    Updated iterm settings

commit 4d9a432a1c1fb14d289fdaa516569cfc0cfc726d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 28 00:44:51 2017 -0400

    Added setup of vscode dotfiles

commit 6dc5ff1bb97901eaa6d1fea411bd4260477ecaf5
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 28 00:44:05 2017 -0400

    Updated flush dns cache alias for macOS

commit 2158ab7ec1dccfe2631876fddd25ff7b9f8fb9a9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Sep 22 18:34:57 2017 -0400

    Added Iterm2 profile
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 4969bdc08d2a9af7bc011411d0cf83cc45f56ede
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Sep 22 18:34:39 2017 -0400

    Added ZSH/OhMyZsh
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 572e9a41edff6e946c8bfe3840ae23d29d93b3ec
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Sep 22 18:33:50 2017 -0400

    Updated Atom settings
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 9fe44a6a11c1000fdbfbe96d73395298c4016f27
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 21 01:18:36 2017 -0400

    Added Visual Studio Code
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit cb51285c47d5b290d05af28977d168486cf91311
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 21 01:18:06 2017 -0400

    Updated VIM Ale bundle
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 0d039608b34d55fcf317d16c48a96c005be4f03e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 21 01:17:43 2017 -0400

    Added Powershell language
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 8b74a4fd54e3940ec3ac7994f6de469fb881233d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Sep 21 01:17:16 2017 -0400

    Updated Atom settings
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit dd35b2ab91c7a16d7b5c05a0d4a8cfeda0afc498
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Sep 6 13:18:35 2017 -0400

    Updated to allow Personal/Work folders specific with different accounts
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 888a738e816ee037b3cdb2afc609c8b9e5157624
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Aug 7 12:41:04 2017 -0400

    Added ls color for Linux
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit b9922fb086e33e7f3c2fec5d857d6f02ef9757ef
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Aug 7 12:09:09 2017 -0400

    Added Linux check for bash_completion
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 07ca0795d59ba3a997e47d10f64c7c925f0dfaa4
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Aug 5 20:21:47 2017 -0400

    Disabled linter-flint Atom plugin
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit abf2764a8464980e5e34f53246c6f13012828811
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jul 24 21:57:15 2017 -0400

    Added .atom/nohup.out
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit c685888c21aab0c2cd80f480a90269f10e1fb50d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jul 24 20:35:40 2017 -0400

    Added export of history sizes
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit ca21c27cc7b64edf620909ce14062da9b00942c6
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Jul 21 22:49:56 2017 -0400

    Enable ATOM Toolbar
    
    Enabled ATOM tool-bar plugin to add the markdown toolbar functionality
    back.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 82cb2d3d1e981e587736cd73280a9b2a3d30303d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Jul 21 22:48:24 2017 -0400

    Add Check For PIP
    
    Recently the pip command has been removed from python using homebrew.
    pip2 is the command to use in place of pip. Added a check to set pip
    command based on whether pip or pip2 is present.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 49e383b2f7869b43a2f829d30c703ef411b4e61b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Jul 18 18:03:56 2017 -0400

    Disable/Uninstall Unused Atom Plugins
    
    Disabled many unused Atom plugins and uninstalled some Atom themes.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 039aed2b37fb783adb874c83dbad95039a0d4a9b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Jul 18 17:35:07 2017 -0400

    Clean Up Aliases For macOS And Add Update Alias
    
    Cleaned up aliases for macOS and also added an update alias for macOS.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit cb06c567d5adee61302efe5b1e916c14110acd10
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Jul 11 00:47:41 2017 -0400

    Added ALE VIM Plugin
    
    Added ALE VIM plugin https://github.com/w0rp/ale
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit da53a49e96dcdf68b9493cc47195f78c28a9a29c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Jul 8 20:12:53 2017 -0400

    Removed CMD Options For Meld
    
    Removed cmd options for using meld for difftool and mergetool. The
    previous settings worked fine on macOS but not on Linux. So to make this
    cross platform compatible those settings have been removed.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit b5b723220c9e49e79a315a4fe67ed8ccfa094aeb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Jul 8 18:47:33 2017 -0400

    Updated Meld Config
    
    Updated the Meld cmd open syntax.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 151dec4ff80079a802f85f7f679948043d3b8606
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jul 6 01:22:54 2017 -0400

    Added missing Python linter
    
    Added missing Python linter plugin for ATOM.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit a75e06f69db5fd8dfa2ff2ef004b9352f2182a6e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jul 6 01:21:57 2017 -0400

    Added new settings
    
    Added new settings for ATOM.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 82561af29cc493ea908ab077b211e071f535e6cd
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jul 6 01:20:48 2017 -0400

    Changed prompt and theme
    
    Changed prompt and theme. The old settings were
    taking up too much of the command prompt in
    certain scenarios. These settings work much better.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit aaa1c06dbcea4d5626bbc5659b70e26d05d0a06f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Jun 23 15:39:32 2017 -0400

    Updated gitignore
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 9bb0c061d3266aa2f6189943038e6aeea52af3f2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Jun 23 15:39:16 2017 -0400

    Added license
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit d96af52e0751a7b3f443289441f8902e3b351f24
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Jun 23 15:38:57 2017 -0400

    Cleaned up formatting and changed license info
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 6b5618a82508723a1313746bd31b037c29dee904
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Jun 22 15:59:17 2017 -0400

    Added TOC using doctoc
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 67fcebe3f6560e469fa7574bfef4e6c27fa02b62
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jun 21 01:21:13 2017 -0400

    Added custom bash prompt options
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 502fcf8c0c1cbb3dcc97830eda66f36947f34bdd
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Jun 21 00:24:39 2017 -0400

    Fixed logic to check for Vundle
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit c50069855cefa61f9d710f5f390ce9c5f5218c7c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Jun 20 16:32:24 2017 -0400

    Added vim bundleinstall
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 71aa98852035d0041aa2436524f7f04cee09f281
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Jun 20 09:14:20 2017 -0400

    Added install of bash-git-prompt for Linux if missing
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 63f3ca4840b5ae82c966c08fb071f99a9a6da104
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Jun 20 09:13:53 2017 -0400

    Changed to use /Users/larry for home path instead of ~
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit d23b360c0f156f737f05eff3b8f7e17a06bd1f37
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jun 19 21:31:04 2017 -0400

    Added package sync
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit d892b12bd90dbcf3b10ebf7b1da6ac0faaac0719
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jun 19 20:06:35 2017 -0400

    Changed vars for dotfiles directory info
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit cccbba91ad3c1c359a0fe66df3cfd119ea97a9af
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Jun 19 20:06:04 2017 -0400

    Updated usage info
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 639c4bfe6f5248164363090902008957613f2f62
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 18 22:59:32 2017 -0400

    Added install instructions for VundleVim
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit b9c32a1b4d6d37df7f0b75fe767997f066b7a175
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 18 22:04:14 2017 -0400

    Added Vundle for plugin management
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 4257b81ae2b591e9350d42aa57fce5d9667e9772
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 18 18:58:17 2017 -0400

    Added setup script to help create and manage
    dotfiles.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit b8deb6ce20cc84d172f66359e69c72b8973229c3
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 18 18:58:10 2017 -0400

    added gitignore
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 3c105dd240111879527308aa04021e1b683d79fb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 18 18:57:06 2017 -0400

    Added VIM config/bundles and etc.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit d54810ee19a9fd5470a11c92e326cfa8411070bf
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 18 18:56:25 2017 -0400

    Added Atom dotfiles.
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit f027dac54b3f52832d388c1d618f240e8c4add90
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 18 18:55:58 2017 -0400

    Cleaned up
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 7029eab900f83ce54ce514de944c605ecf14dd60
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 18 18:54:41 2017 -0400

    Updated global git config info
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit d04b8b7819a4dcd61772c0ac7858fe990386d21f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Jun 18 18:54:22 2017 -0400

    Updated repo info and usage
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 4dc6b514b4b5dce8e44c0470eae875436b74e9b1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Jun 17 02:09:29 2017 -0400

    Added path to go binaries if go is found
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 91987576bbd49bfdbb54d7b4bb727c3aacd0b30a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Jun 17 01:56:12 2017 -0400

    Added check for GO and set GOPATH if found
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit ea2d734d9c3d524e228c0fd1d2e30bff6b86ea7b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Jun 17 00:44:46 2017 -0400

    Source global /etc/bashrc if it exists
    
    Signed-off-by: Larry Smith Jr <mrlesmithjr@gmail.com>

commit 1c5e9a72cf1e95dac1354e4ee11b96536bf4ebab
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Jun 17 00:28:05 2017 -0400

    first commit
