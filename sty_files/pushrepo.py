import os
import shutil

def find_path():
    
    distpth = None
    
    # set current directory name and move up one directory
    current = os.path.abspath(os.getcwd())
    os.chdir('..')
   
    # create filename (locpth) for query and run query
    # query results will be saved to locpth
    locpth = os.path.join(current, 'usgs.pth') 
    cmd = 'kpsewhich usgsreporta.sty > {}'.format(locpth)
    os.system(cmd)
    
    # change back to starting directory
    os.chdir(current)
    
    # read data from query file
    f = open(locpth, 'r')
    line = f.readline()
    f.close()
    
    if len(line.strip()) > 0:
        distpth = os.path.dirname(os.path.abspath(line))
    
    # remove query file
    os.remove(locpth)
    
    return distpth
    
def update_files(distpth):
    success = False
    
    valid_ext = ['.sty', '.cls']
    files = [f for f in os.listdir('.') if os.path.isfile(f)]
    for fpth in files:
        comp = False
        for ext in valid_ext:
            if fpth.endswith(ext):
                comp = True
                break
        if comp:
            print('checking...{}'.format(fpth))
            f2pth = os.path.join(distpth, fpth)
            cpy = False
            if os.path.isfile(f2pth):
                if os.path.getmtime(fpth) > os.path.getmtime(f2pth):
                    print('  {} is newer'.format(fpth))
                    cpy = True    
            else:
                cpy = True
            if cpy:
                shutil.copy(fpth, distpth)
            
            


if __name__ == "__main__":
    distpth = find_path()
    if distpth is not None:
        print('moving updated files to...\n  {}'.format(distpth))
        success = update_files(distpth)