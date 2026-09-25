| Commit | HASH | Описание |
| --- | --- | --- |
| v1.0.0 | 7eacbc7 | Initial commit of the Zybo Z7 IMX219 camera-to-HDMI project. |
| v1.0.1 | b9a4ea6 | DEMOSAIC RGGB not work |
| v1.0.2 | e4286de | DEMOSAIC RGGB - FIX |
| v1.0.3 | f050389 | DEMOSAIC RGGB - FIX V2 |
| v1.0.4 | fc12f30 | Add FPS + Drop Frame title |

'''
add 
    sensor temp
    time between freme
    color temp
    demosaic type
'''
--------------------------------------------------

git log --oneline
git add .
git commit -m "DEMOSAIC RGGB - FIX V2"

git push
git push origin main
