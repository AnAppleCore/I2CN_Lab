
import sys, random, argparse
import numpy as np
import math

from PIL import Image

gscale1 = "BWMoahkbdpqwmZO0QLCJUYXzcvunxrjfti"

gscale2 = 'unxrjfti'


def getAverageL(image):
    im = np.array(image)
    w, h = im.shape
    return np.average(im.reshape(w * h))


def covertImageToAscii(fileName, cols, scale, moreLevels):
    global gscale1, gscale2
    image = Image.open(fileName).convert('L')
    W, H = image.size[0], image.size[1]
    print("image width x height: %dx%d" % (W, H))
    w = W / cols
    h = w / scale
    rows = int(H / h)
    print("\t%d rows %d columns" % (rows,cols))
    print("block width x height: %dx%d" % (w, h))

    if cols > W or rows > H:
        print("image too small!")
        exit(0)

    aimg = []
    for j in range(rows):
        y1 = int(j * h)
        y2 = int((j + 1) * h)
        if j == rows - 1:
            y2 = H
        aimg.append("1.")
        for i in range(cols):
            x1 = int(i * w)
            x2 = int((i + 1) * w)
            if i == cols - 1:
                x2 = W
            img = image.crop((x1, y1, x2, y2))
            avg = int(getAverageL(img))
            if moreLevels:
                gsval = gscale1[int((avg * 33) / 255)]
            else:
                gsval = gscale2[int((avg * 7) / 255)]
            aimg[j] += gsval
        aimg[j] += ".1"
    return aimg


def main():
    descStr = "python image 2 ASCII"
    parser = argparse.ArgumentParser(description=descStr)

    parser.add_argument('--file', dest='imgFile', required=True)
    parser.add_argument('--scale', dest='scale', required=False)
    parser.add_argument('--out', dest='outFile', required=False)
    parser.add_argument('--cols', dest='cols', required=False)
    parser.add_argument('--morelevels', dest='moreLevels', action='store_true')
    parser.add_argument('-c', '--covert2hosts', action='store_true')

    args = parser.parse_args()

    imgFile = args.imgFile
    outFile = 'out.txt'
    outhostsfile = 'lab5.hosts'
    if args.outFile:
        outFile = args.outFile
    scale = 0.43
    if args.scale:
        scale = float(args.scale)
    cols = 80
    if args.cols:
        cols = int(args.cols)

    aimg = covertImageToAscii(imgFile, cols, scale, args.moreLevels)

    f = open(outFile, 'w')
    for row in aimg:
        f.write(row + '\n')
    f.close()
    print("ASCII text stored in %s" % outFile)
    if args.covert2hosts:
        OutHostsFile = 'lab5.hosts'
        with open(outhostsfile, 'w') as f:
            f.write('127.0.0.1\tlocalhost\n')
            f.write('127.0.0.1\tI2CN\n')
            for no, row in enumerate(aimg):
                f.write('10.0.0.'+str((no+1)*2)+'\t'+row+'\n')
            f.write('::1\tlocalhost ip6-localhost ip6-loopback\n')
            f.write('ff02::1\tip6-allnodes\n')
            f.write('ff02::2\tip6-allrouters\n')
        print('Processed hosts file:', OutHostsFile)

if __name__ == '__main__':
    main()