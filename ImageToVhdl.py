from PIL import Image

im = Image.open('/content/start_screen_es4.png', 'r')

width, height = im.size

pixel_values = list(im.getdata())


file = open("end_screen.txt", 'w')



fileWidth = width

xCoordinate = -1

yCoordinate = 0



# Divide 255 color by 85
#gets rgd value


for i in range(len(pixel_values)):

    xCoordinate += 1

    if xCoordinate == fileWidth:

        yCoordinate += 1

        xCoordinate= 0



    addr = str(f'{yCoordinate:06b}') + str(f'{xCoordinate:07b}')


    red = int(pixel_values[i][0] // 85)

    green = int(pixel_values[i][1] // 85)

    blue = int(pixel_values[i][2] // 85)





    color = str(f'{red:02b}') + str(f'{green:02b}') + str(f'{blue:02b}')
    if (color != "111111"):
      file.write('            when "' + addr + '" => rgb <= "' + color + '";\n')


file.write('                    when others => rgb <= "111111";\n')



file.close()