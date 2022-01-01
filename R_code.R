## connect github
library(usethis)
use_github()

### grid package function

###### day1
# reference https://emitanaka.org/datavis-adv-workshop/slides/day1-session1.pdf

packageDescription("grid")
library(grid)
grid.circle()
grid.draw(circleGrob())

pushViewport(plotViewport())
pushViewport(viewport(xscale = c(0,100)))
grid.xaxis()

shape<-circleGrob(x=0.5,y=0.5,r=0.5,name="shape")
eyes<-circleGrob(x=c(0.25,0.75),y=0.5,r=0.05,
                 gp=gpar(fill="black"),name="eyes")
mouth<-circleGrob(x=0.5,y=0.2,r=0.1,name="mouth")
face1<-gList(shape,eyes,mouth)
face2<-grobTree(shape,eyes,mouth,name="face")
grid.draw(face1)
grid.newpage()
grid.draw(face2)
grid.ls(face1)
grid.ls(face2)
class(face1)
class(face2)

g1<-grob(x=unit(0.5,'npc'),
         y=unit(0.5,"npc"),
         r=unit(0.5,"npc"),
         cl="circle")
grid.ls(g1)
grid.draw(g1)

g2<-gTree(children = gList(shape,
                           eyes,
                           mouth))
grid.draw(g2)
grid.newpage()
grid.ls(face2)
grid.draw(removeGrob(face2,"mouth"))
xaxis<-xaxisGrob()
grid.ls()
xaxisf<-grid.force(xaxis)
grid.ls(xaxisf)

grid.newpage()
grid.rect(x=0,y=0,width = 0.25,
          height = 0.25,
          default.units = "npc",
          just = c("left","bottom"),
          gp=gpar(fill="pink"),
          vp=NULL)


grid.rect(x=0.5,y=0.5,
          width = 0.25,
          height = 0.25,
          default.units = "npc",
          just = c("left","bottom"),
          gp=gpar(fill="pink"),
          vp=NULL)

grid.rect(x=0.5,
          y=0.5,
          width = 0.25,
          height = 0.25,
          default.units = "npc",
          just = c("center","center"),
          gp=gpar(fill="pink"),
          vp=NULL)

grid.circle(
  x=1:6,
  y=3,
  r=1:6/6,
  default.units = "in",
  gp=gpar(fill=sample(colors(),6)),
  vp=NULL
)
